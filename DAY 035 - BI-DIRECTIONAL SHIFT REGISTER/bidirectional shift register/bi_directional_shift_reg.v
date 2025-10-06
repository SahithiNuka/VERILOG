module bidir_shift_reg_gate (clk,clr,mode,dr,dl,q);
	input clk;
	input clr;
	input mode;     // 0 = left, 1 = right
	input dr;       // Data for right shift
	input dl; // Data for left shift
    output [3:0] q;

	wire d0, d1, d2, d3;
	wire q0, q1, q2, q3;
   
	assign d0 = (mode & q1) | (~mode & dl);
	assign d1 = (mode & q2) | (~mode & q0);
	assign d2 = (mode & q3) | (~mode & q1);
	assign d3 = (mode & dr) | (~mode & q2);

	d_ff FF0(clk, clr, d0, q0);
	d_ff FF1(clk, clr, d1, q1);
	d_ff FF2(clk, clr, d2, q2);
	d_ff FF3(clk, clr, d3, q3);

	assign q = {q3, q2, q1, q0};

endmodule


module d_ff(clk,clr,d,q);
	input clk,clr,d;
	output reg q;
	
	always@(posedge clk or negedge clr)
		begin
			if(~clr)
				q <= 1'b0;
			else
				q <= d;
		end
endmodule