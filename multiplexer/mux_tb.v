`timescale 1ns/1ps

module mux_tb;
    parameter WIDTH = 8;

 
    reg [WIDTH-1:0] in0, in1;  
    reg select;                 
    wire [WIDTH-1:0] out;       

    mux #(WIDTH) uut (
        .in0(in0),
        .in1(in1),
        .select(select),
        .out(out)
    );

    initial begin

        in0 = 8'b10101010;  
        in1 = 8'b11001100;  
        select = 0;        
        #20;               

        select = 1;         
        #20;

        in0 = 8'b11110000;  
        in1 = 8'b00001111; 
        select = 0;       
        #20;

        select = 1;
        #20;

        $finish;
    end
endmodule
