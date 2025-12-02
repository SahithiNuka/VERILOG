// Code your testbench here
// or browse Examples
`timescale 1ns/1ps

module even_odd_tb;

    reg [7:0] num;
    wire is_even, is_odd;

    even_odd eo(num,is_even,is_odd);

    initial begin
        num = 4; #10;
        $display("%0d even=%b, odd=%b", num, is_even, is_odd);

        num = 7; #10;
        $display("%0d even=%b, odd=%b", num, is_even, is_odd);

        num = 10; #10;
        $display("%0d even=%b, odd=%b", num, is_even, is_odd);

        $finish;
    end

endmodule
