`timescale 1ns / 1ps

module RLE_tb;

    reg clk;
    reg write_enable_a;
    reg [9:0] addr_a;
    reg [31:0] write_data_a;
    reg [9:0] addr_b;
    wire [31:0] read_data_b;


    RLE uut (
        .clk(clk),
        .write_enable_a(write_enable_a),
        .addr_a(addr_a),
        .write_data_a(write_data_a),
        .addr_b(addr_b),
        .read_data_b(read_data_b)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        write_enable_a = 0;
        addr_a = 0;
        addr_b = 0;
        write_data_a = 0;

        // --- Тест 1: Десятичные числа ---
        $display("Тест 1: Десятичные числа");
        #10 write_enable_a = 1;

        write_data_a = 32'd5; addr_a = addr_a + 1; #10;
        write_data_a = 32'd5; addr_a = addr_a + 1; #10;
        write_data_a = 32'd5; addr_a = addr_a + 1; #10;
        write_data_a = 32'd7; addr_a = addr_a + 1; #10;
        write_data_a = 32'd7; addr_a = addr_a + 1; #10;
        write_data_a = 32'd9; addr_a = addr_a + 1; #10;

        write_enable_a = 0; 
        #50; 

        $write("Результат RLE: ");
        addr_b = 0;
        repeat (5) begin
            #10 $write("%d%d ", read_data_b[15:8], read_data_b[7:0]); 
            addr_b = addr_b + 1;
        end
        $display("");

        // --- Тест 2: Восьмеричные числа ---
        $display("Тест 2: Восьмеричные числа");
        #10 write_enable_a = 1;

        write_data_a = 32'o7; addr_a = addr_a + 1; #10;
        write_data_a = 32'o7; addr_a = addr_a + 1; #10;
        write_data_a = 32'o10; addr_a = addr_a + 1; #10;
        write_data_a = 32'o10; addr_a = addr_a + 1; #10;
        write_data_a = 32'o12; addr_a = addr_a + 1; #10;

        write_enable_a = 0; 
        #50;

        $write("Результат RLE: ");
        addr_b = 0;
        repeat (4) begin
            #10 $write("%0o%0o ", read_data_b[15:8], read_data_b[7:0]); 
            addr_b = addr_b + 1;
        end
        $display("");

        // --- Тест 3: Шестнадцатеричные числа ---
        $display("Тест 3: Шестнадцатеричные числа");
        #10 write_enable_a = 1;

        write_data_a = 32'hA; addr_a = addr_a + 1; #10;
        write_data_a = 32'hA; addr_a = addr_a + 1; #10;
        write_data_a = 32'hF; addr_a = addr_a + 1; #10;
        write_data_a = 32'hF; addr_a = addr_a + 1; #10;
        write_data_a = 32'hF; addr_a = addr_a + 1; #10;
        write_data_a = 32'h1; addr_a = addr_a + 1; #10;

        write_enable_a = 0; 
        #50; 

        $write("Результат RLE: ");
        addr_b = 0;
        repeat (4) begin
            #10 $write("%0h%0h ", read_data_b[15:8], read_data_b[7:0]);
            addr_b = addr_b + 1;
        end
        $display("");

        $finish;
    end

endmodule

