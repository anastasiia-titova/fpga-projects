`timescale 1ns / 1ps

module fsm_tb;

    reg clk;                 
    reg reset;               
    reg in;                  
    wire [1:0] state;       
    wire [1:0] next_state;  
    wire out;                

    fsm uut (
        .clk(clk),
        .reset(reset),
        .in(in),
        .state(state),
        .next_state(next_state),
        .out(out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin

        reset = 1;
        in = 0;

        #10 reset = 0;

        $display("Начало теста");

        in = 0;
        #10;
        $display("State: %b, Next State: %b, Out: %b", state, next_state, out);

        in = 1;
        #10;
        $display("State: %b, Next State: %b, Out: %b", state, next_state, out);

        in = 1;
        #10;
        $display("State: %b, Next State: %b, Out: %b", state, next_state, out);

        in = 0;
        #10;
        $display("State: %b, Next State: %b, Out: %b", state, next_state, out);

        in = 0;
        #10;
        $display("State: %b, Next State: %b, Out: %b", state, next_state, out);

        reset = 1;
        #10;
        reset = 0;

        $display("Сброс выполнен");
        #10;
        $display("State: %b, Next State: %b, Out: %b", state, next_state, out);

        $stop; 
    end

endmodule
