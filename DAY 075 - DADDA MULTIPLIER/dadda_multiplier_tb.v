module dadda_multiplier_tb();
	reg [7:0]a,b;
	wire [15:0]y;
	
	dadda_multiplier dm(a,b,y);
	
	initial
		begin
			a = 0;
			b = 0;
			#10;
			a = 8'd7;
			b = 8'd10;
			#10;
			a = 8'd2;
			b = 8'd10;
			#10;
			a = 8'd20;
			b = 8'd40;
			#10;
			a = 8'd31;
			b = 8'd9;
			#10;
			$finish;
		end
		
	initial
		$monitor("a=%d: %b, b=%d: %b, product=%d: %b",a,a,b,b,y,y);
	
endmodule