module demux #(parameter N = 2) (
    input wire [N-1:0] din,
    input wire [N-1:0] sel,
    output reg [2**N-1:0] dout
);

    always @(din) begin
        dout = 0; 
        dout[sel] = din; 
    end

endmodule
