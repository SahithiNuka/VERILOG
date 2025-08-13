module not_gate_tb();
	reg a;
	wire y;
	
	not_gate n1(a,y);
	
	initial
		begin
			a = 1'b0;
			#10;
			a = 1'b1;
			#10;
			$finish;
		end
	initial
		$monitor("a=%b,y=%b",a,y);

endmodule