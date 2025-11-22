module wallace_multiplier_tb;
	reg [3:0]a,b;
	wire [7:0]product;
	
	wallace_multiplier wm(a,b,product);
	
	initial
		begin
			a = 0;
			b = 0;
			#10;
			a = 4'd4;
			b = 4'd5;
			#10;
			a = 4'd8;
			b = 4'd3;
			#10;
			a = 4'd9;
			b = 4'd5;
			#10;
			a = 4'd12;
			b = 4'd4;
			#10;
			a = 4'd15;
			b = 4'd5;
			#10;
			$finish;
		end
		
	initial
		$monitor("a=%d: %b, b=%d: %b, product=%d: %b",a,a,b,b,product,product);
		
endmodule