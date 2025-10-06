module mux_5x1_tb();
	reg [4:0]i;
	reg [2:0]s;
	wire y;
	
	mux_5x1 m1(i,s,y);
	
	initial
		begin
			i = 5'b10101;
			s = 3'd0;
			#10;
			
			i = 5'b10101;
			s = 3'd1;
			#10;
			
			i = 5'b10101;
			s = 3'd2;
			#10;
			
			i = 5'b10101;
			s = 3'd3;
			#10;
			
			i = 5'b10101;
			s = 3'd4;
			#10;
			
			i = 5'b10101;
			s = 3'd7;
			#10;
			$finish;
		end
		
	initial
		$monitor("i=%b,s=%b,y=%b",i,s,y);
endmodule