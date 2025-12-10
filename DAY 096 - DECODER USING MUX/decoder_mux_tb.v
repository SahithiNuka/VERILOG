module decoder_mux_tb;
	reg a,b;
	wire [3:0]y;

	decoder_mux dec(a,b,y);

	initial begin
		{a,b} = 2'b00;
		#10;
		
		{a,b} = 2'b01;
		#10;
		
		{a,b} = 2'b10;
		#10;
		
		{a,b} = 2'b11;
		#10;
		$finish;

	end
   
	initial
		$monitor("a=%b, b=%b, y=%b",a,b,y);
endmodule

