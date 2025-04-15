module RLE (
    input clk,
    input write_enable_a,        
    input [9:0] addr_a,          
    input [31:0] write_data_a,   
    output [31:0] read_data_b,   
    input [9:0] addr_b           
);

    wire [31:0] read_data_a;      
    reg [9:0] rle_read_addr;      
    reg [9:0] rle_write_addr;     
    reg write_enable_rle;         
    reg [31:0] write_data_rle;    

    reg [7:0] rle_data_in;        
    reg rle_valid_in;           
    wire [7:0] rle_data_out;      
    wire [7:0] rle_count_out;    
    wire rle_valid_out;           

    RAM1 RAM1_inst (
        .address(write_enable_a ? addr_a : rle_read_addr), 
        .clock(clk),
        .data(write_data_a),
        .wren(write_enable_a),
        .q(read_data_a)
    );

    RAM2 RAM2_inst (
        .address(write_enable_rle ? rle_write_addr : addr_b), 
        .clock(clk),
        .data(write_data_rle),
        .wren(write_enable_rle),
        .q(read_data_b)
    );

    RLE RLE_inst (
        .clk(clk),
        .reset(~write_enable_a), 
        .data_in(rle_data_in),
        .valid_in(rle_valid_in),
        .data_out(rle_data_out),
        .count_out(rle_count_out),
        .valid_out(rle_valid_out)
    );

    always @(posedge clk) begin
        if (~write_enable_a) begin
            rle_read_addr <= 0;         
            rle_write_addr <= 0;        
            rle_valid_in <= 1'b1;       
            write_enable_rle <= 1'b0;  
        end else begin
            rle_valid_in <= 1'b0;
            write_enable_rle <= 1'b0;
        end

        if (rle_valid_in) begin
            rle_data_in <= read_data_a[7:0]; 
            rle_read_addr <= rle_read_addr + 1;

            if (rle_valid_out) begin
                write_data_rle <= {16'd0, rle_count_out, rle_data_out}; 
                write_enable_rle <= 1'b1;
                rle_write_addr <= rle_write_addr + 1;
            end else begin
                write_enable_rle <= 1'b0;
            end
        end
    end

endmodule
