module fsm(
    input wire clk,        
    input wire reset,       
    input wire in,          
    output reg [1:0] state,  
    output reg [1:0] next_state, 
    output reg out           
);

    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;

    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0; 
        else
            state <= next_state; 
    end

    always @(*) begin
        case (state)
            S0: if (in) next_state = S1; else next_state = S0;
            S1: if (in) next_state = S2; else next_state = S0;
            S2: if (in) next_state = S2; else next_state = S1;
            default: next_state = S0;
        endcase
    end

    always @(*) begin
        case (state)
            S0: out = 0;
            S1: out = 1;
            S2: out = 0;
            default: out = 0;
        endcase
    end

endmodule
