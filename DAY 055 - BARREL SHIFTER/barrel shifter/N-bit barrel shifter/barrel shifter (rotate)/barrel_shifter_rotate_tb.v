module barrel_shifter_rotate_tb();
	parameter N = 8;
	
	reg [N-1:0]din;
	reg [$clog2(N)-1:0]sh_amt;
	reg dir;
	
	wire [N-1:0]dout;
	
	barrel_shifter_rotate a1(din,sh_amt,dir,dout);
	
	initial
		begin
			din = 8'b10110011;
			
			dir = 0; //left shift
			sh_amt = 0; 
			#10;
			sh_amt = 1; 
			#10;
			sh_amt = 2; 
			#10;
			sh_amt = 3; 
			#10;
			sh_amt = 4; 
			#10;
			sh_amt = 5; 
			#10;
			sh_amt = 6; 
			#10;
			sh_amt = 7; 
			#10;
			
			dir = 1; 
			sh_amt = 1; 
			#10;
			sh_amt = 2; 
			#10;
			sh_amt = 3; 
			#10;
			sh_amt = 4; 
			#10;
			sh_amt = 5; 
			#10;
			sh_amt = 6; 
			#10;
			sh_amt = 7; 
			#10;
			
			$finish;
		end
		
		initial
			$monitor("time=%t,din=%b,sh_amt=%b,dir=%b,dout=%b",$time,din,sh_amt,dir,dout);

endmodule