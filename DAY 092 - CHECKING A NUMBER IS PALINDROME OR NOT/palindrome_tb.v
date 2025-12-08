module palindrome_tb;

    reg  [9:0] number;
    wire is_palindrome;

    palindrome_checker palindrome(number, is_palindrome);
	
    initial 
		begin
			$monitor("Time=%t, number=%0d, is palindrome=%b", $time, number, is_palindrome);
			number = 121; #10;
			number = 786; #10;
			number = 909; #10;
			number = 555; #10;
			number = 123; #10;
			$finish;
		end

endmodule
