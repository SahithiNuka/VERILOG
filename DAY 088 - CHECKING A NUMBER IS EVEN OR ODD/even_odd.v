module even_odd(num,is_even,is_odd);
    input  [7:0] num;
    output       is_even;
    output       is_odd;

    assign is_even = (num[0] == 1'b0);  // LSB = 0 → even
    assign is_odd  = (num[0] == 1'b1);  // LSB = 1 → odd

endmodule
