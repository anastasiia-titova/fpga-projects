`timescale 1ns/1ps

module decoder_tb;
    parameter WIDTH = 8;
    
    reg [$clog2(WIDTH)-1:0] in;  
    reg enable;                  
    wire [WIDTH-1:0] out;        

    decoder #(WIDTH) uut (
        .in(in),
        .out(out),
        .enable(enable)
    );

    initial begin

        enable = 0;
        in = 3;
        #10;  

        enable = 1;
        in = 3;
        #10;  

        in = 7;
        #10;

        in = 0;
        #10;

        $finish;
    end
endmodule

