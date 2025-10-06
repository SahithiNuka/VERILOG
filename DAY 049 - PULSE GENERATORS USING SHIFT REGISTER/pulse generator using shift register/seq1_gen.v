module seq1_gen(clk,rst,f);
	input clk,rst;
	output f;
	
	wire [3:0]q,qb;
	
	d_ff d1(clk,rst,f,q[0],qb[0]);
	d_ff d2(clk,rst,q[0],q[1],qb[1]);
	d_ff d3(clk,rst,q[1],q[2],qb[2]);
	d_ff d4(clk,rst,q[2],q[3],qb[3]);
	
	nand n1(f,q[0],q[2],q[3]);
endmodule

module d_ff(clk,rst,d,q,qb);
	input clk,rst,d;
	output reg q;
	output qb;
	
	always@(posedge clk)
		begin
			if(rst)
				q <= 1'b0;
			else
				q <= d;
		end
	assign qb = ~q;
endmodule