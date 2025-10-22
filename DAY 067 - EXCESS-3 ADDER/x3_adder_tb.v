module x3_adder_tb();
	reg [3:0]a,b;
	reg cin;
	wire [4:0]x;
	wire cout;
	
	x3_adder xa(a,b,cin,x,cout);
	
	initial
		begin
			a = 4'b1001; // 6 IN x3
			b = 4'b0110; // 3 IN x3
			cin = 1'b0;
			#10;
			a = 4'b1100; // 9 IN x3
			b = 4'b1000; // 5 IN x3
			cin = 1'b0;
			#10;
			a = 4'b1100; // 9 IN x3
			b = 4'b1010; // 7 IN x3
			#10;
			$finish;
		end
		
	initial
      $monitor("THE SUM IN EXCESS-3 IS: a=%b,b=%b,cin=%b,x=%b,cout=%b",a,b,cin,x,cout);
endmodule