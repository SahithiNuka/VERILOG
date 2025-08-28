module barrel_shifter_arith_right_tb();
	reg [3:0]din;
	reg [1:0]sh_amt;
	wire [3:0]dout;
	
	barrel_shifter_arith_right(din,sh_amt,dout);
	
	initial
		begin
			din = 4'b1010; //-6
			sh_amt = 2'b00;
			#10;
			sh_amt = 2'b01;
			#10;
			sh_amt = 2'b10;
			#10;
			sh_amt = 2'b11;
			#10;
			
			din = 4'b0110; //+6
			sh_amt = 2'b00;
			#10;
			sh_amt = 2'b01;
			#10;
			sh_amt = 2'b10;
			#10;
			sh_amt = 2'b11;
			#10;
			
			$finish;
		end
		
	initial
		$monitor("time=%t, din=%b, sh_amt=%b, dout=%b",$time,din,sh_amt,dout);
		
endmodule