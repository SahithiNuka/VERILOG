module barrel_shifter_rotate_tb();
	reg [3:0]din;
	reg [1:0]sh_amt;
	reg dir;
	wire [3:0]dout;
	
	barrel_shifter_rotate a1(din,sh_amt,dir,dout);
	
	initial
		begin
			din = 4'b1011;
			
			dir = 1'b0; //left
			
			sh_amt = 2'b00;
			#10;
			sh_amt = 2'b01;
			#10;
			sh_amt = 2'b10;
			#10;
			sh_amt = 2'b11;
			#10;
			
			dir = 1; //right
			
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
		$monitor("time=%t, din=%b, sh_amt=%b, dir=%b, dout=%b",$time,din,sh_amt,dir,dout);
		
endmodule