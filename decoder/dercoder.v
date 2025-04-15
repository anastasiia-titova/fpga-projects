module decoder #(parameter WIDTH = 8) (
    input  wire [$clog2(WIDTH)-1:0] in,
    output reg [WIDTH-1:0] out,         
    input  wire enable                  
);

    always @(*) begin

        if (enable) begin
            out = 0;
            out[in] = 1'b1;  
        end else begin
            out = 0;  
        end
    end
endmodule
