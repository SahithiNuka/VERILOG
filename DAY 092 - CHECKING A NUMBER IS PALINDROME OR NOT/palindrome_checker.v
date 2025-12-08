module palindrome_checker(number, is_palindrome);
    input  [9:0] number;
    output reg   is_palindrome;

    integer d2, d1, d0;

    always @(*) 
		begin
			d2 = number / 100;          // MS digit
			d1 = (number / 10) % 10;    // middle digit
			d0 = number % 10;           // LS digit

			// Check palindrome
			if (d2 == d0)
				is_palindrome = 1'b1;
			else
				is_palindrome = 1'b0;
		end

endmodule
