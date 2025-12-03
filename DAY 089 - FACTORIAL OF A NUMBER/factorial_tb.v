module factorial_tb;

    reg [7:0] num;
    wire [31:0] fact;

    factorial_num fn(num,fact);

    initial begin
        num = 5; #10;
        $display("5! = %0d", fact);

        num = 7; #10;
        $display("7! = %0d", fact);

        num = 10; #10;
        $display("10! = %0d", fact);

        $finish;
    end

endmodule
