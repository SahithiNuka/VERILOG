module barrel_shifter_arith_right(din,sh_amt,dout);
	input [3:0]din;
	input [1:0]sh_amt;
	output reg [3:0]dout;
	
	always@(*)
		begin
			case(sh_amt)
				0: dout = din;
				1: dout = {din[3],din[3:1]};
				2: dout = {din[3],din[3],din[3:2]};
				3: dout = {din[3],din[3],din[3],din[3]};
			endcase
		end
	endmodule
	
////////// ARITHMETIC LEFT SHIFT IS SAME AS LOGICAL LEFT SHIFT ///////