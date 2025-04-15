module demux_tb;

    reg [1:0] din;
    reg [1:0] sel;
    wire [3:0] dout;

    
    demux #(2) uut (
        .din(din),
        .sel(sel),
        .dout(dout)
    );

    initial begin
        din = 2'b00;
        sel = 2'b00;

      
        #10 din = 2'b01; sel = 2'b00;
        #10 din = 2'b10; sel = 2'b01; 
        #10 din = 2'b11; sel = 2'b10; 
        #10 sel = 2'b11;             
        #10 $finish;
    end

endmodule