module braun_multiplier_tb();
	reg [3:0]a,b;
	wire [7:0]p;
	
	braun_multiplier bm(a,b,p);
	
	initial
		begin
			a = 4'd0;
			b = 4'd0;
			#10;
			a = 4'd6;
			b = 4'd3;
			#10;
			a = 4'd8;
			b = 4'd3;
			#10;
			a = 4'd9;
			b = 4'd8;
			#10;
			a = 4'd10;
			b = 4'd13;
			#10;
			a = 4'd14;
			b = 4'd13;
			#10;
			$finish;
		end
	initial
		$monitor("a=%d: %b, b=%d: %b, product=%d: %b",a,a,b,b,p,p);

endmodule