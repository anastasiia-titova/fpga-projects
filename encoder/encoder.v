module encoder #(parameter WIDTH = 8) (
    input  wire [WIDTH-1:0] in, 
    output reg  [$clog2(WIDTH)-1:0] out, 
    output reg  valid                 
);
    integer i;

    always @(*) begin
        valid = 0;
        out = 0;
        for (i = 0; i < WIDTH; i = i + 1) begin
            if (in[i]) begin
                out = i;
                valid = 1;
            end
        end
    end
endmodule
