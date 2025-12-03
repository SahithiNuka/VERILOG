module factorial_num(num,fact);
    input  [7:0] num;
    output [31:0] fact;

    function [31:0] factorial;
        input [7:0] n;
        integer i;
        begin
            factorial = 1;
            for (i = 1; i <= n; i = i + 1)
                factorial = factorial * i;
        end
    endfunction

    assign fact = factorial(num);

endmodule
