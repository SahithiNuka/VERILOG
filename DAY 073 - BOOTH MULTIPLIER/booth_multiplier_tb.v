module booth_multiplier_tb;
	reg signed [3:0] multiplicand;
	reg signed [3:0] multiplier;
	wire signed [7:0] product;
  
	booth_multiplier dut (multiplicand, multiplier, product);

	initial 
		begin
			$monitor("multiplicand = %d: %b, multiplier = %d: %b, product = %d: %b", multiplicand,multiplicand,multiplier,multiplier,product,product);
			multiplicand = 4'b0011;
			multiplier = 4'b0001;
			#10;
			multiplicand = 4'b1010;
			multiplier = 4'b0111;
			#10;
			multiplicand = 4'b1110;
			multiplier = 4'b1011;
			#10;
			multiplicand = 4'b1011;
			multiplier = 4'b1011;
			#10;
			$finish;
		end
endmodule
