module Prime_number(number,is_prime);
    input  [7:0] number;
    output reg   is_prime;

	parameter PRIME     = 1'b1, Not_PRIME = 1'b0;

	always @(number) 
		begin
			is_prime = check_prime(number);

			if (is_prime == 1'b1)
				$display("%0d is a prime number", number);
			else
				$display("%0d is not a prime number", number);
		end

	function automatic check_prime;
		input [7:0] num;
		integer i;
		begin
			if (num < 2) 
				begin
					check_prime = Not_PRIME;
				end
			else 
				begin
					check_prime = PRIME;  
					for (i = 2; i <= num/2; i = i + 1) 
						begin	
							if (num % i == 0)
								check_prime = Not_PRIME;
						end
				end
		end
endfunction

endmodule
