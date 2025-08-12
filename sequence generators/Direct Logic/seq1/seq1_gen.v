module seq1_gen(clk,rst,qout);
	input clk,rst;
	output qout;
	
	wire [2:1]q;
	wire [2:0]qb;
	wire [3:0]w;
	
	and a1(w[0],qb[2],qb[1]);
	or o1(w[1],qb[0],w[0]); //d0
	
	and a2(w[2],qb[2],qout); //d1
	
	and a3(w[3],q[1],qb[0]); //d2
	
	d_ff d1(clk,rst,w[1],qout,qb[0]);
	d_ff d2(clk,rst,w[2],q[1],qb[1]);
	d_ff d3(clk,rst,w[3],q[2],qb[2]);
	
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