module mux #(parameter WIDTH = 8) (
    input wire [WIDTH-1:0] in0,   
    input wire [WIDTH-1:0] in1,   
    input wire select,           
    output wire [WIDTH-1:0] out  
);

    assign out = (select) ? in1 : in0;  

endmodule
