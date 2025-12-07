module armstrong_checker(num, is_armstrong);
    input  [9:0] num;
    output reg   is_armstrong;

    reg [3:0] d0, d1, d2; // units, tens, hundreds
    reg [9:0] sum; // holds a^3 + b^3 + c^3

    // Function to calculate cube
    function [9:0] cube;
        input [3:0] x;
			begin
				cube = x * x * x;
			end
    endfunction

    always @(*)
		begin
			// Split digits
			d0 = num % 10;         // ones digit
			d1 = (num / 10) % 10;  // tens digit
			d2 = num / 100;        // hundreds

			sum = cube(d0) + cube(d1) + cube(d2);

			// Check Armstrong condition
			if (sum == num)
				is_armstrong = 1'b1;
			else
				is_armstrong = 1'b0;
		end

endmodule
