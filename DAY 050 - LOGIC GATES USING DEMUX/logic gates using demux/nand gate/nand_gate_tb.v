module nand_gate_tb();
	reg a,b;
	wire y;
	
	nand_gate a1(a,b,y);
	
	initial
		begin
			a = 1'b0;
			b = 1'b0;
			#10;
			
			a = 1'b1;
			b = 1'b0;
			#10;
			
			a = 1'b0;
			b = 1'b1;
			#10;
			
			a = 1'b1;
			b = 1'b1;
			#10;
			$finish;
		end
	initial
		$monitor("a=%b,b=%b,y=%b",a,b,y);

endmodule