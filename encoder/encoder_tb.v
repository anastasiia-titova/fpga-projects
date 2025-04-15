`timescale 1ns/1ps

module encoder_tb;
    parameter WIDTH = 8;

    reg [WIDTH-1:0] in;

    wire [$clog2(WIDTH)-1:0] out;
    wire valid;

    encoder #(WIDTH) uut (
        .in(in),
        .out(out),
        .valid(valid)
    );

    initial begin
        
        in = 8'b00001000;
        #10;

        in = 8'b10000000;
        #10;

        in = 8'b10101010;
        #10;

        in = 8'b00000001;
        #10;

        $finish;
    end
endmodule


