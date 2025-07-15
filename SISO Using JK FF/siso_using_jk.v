module siso_using_jk(clk,rst,sin,sout);
	input clk,rst;
	input sin;
	output sout;
	
	wire [2:0]q;
	wire [3:0]qb;
	wire w1;
	
	not n1(w1,sin);
	
	jk_ff j1(clk,rst,sin,w1,q[0],qb[0]);
	jk_ff j2(clk,rst,q[0],qb[0],q[1],qb[1]);
	jk_ff j3(clk,rst,q[1],qb[1],q[2],qb[2]);
	jk_ff j4(clk,rst,q[2],qb[2],sout,qb[3]);

endmodule


module jk_ff(clk,rst,j,k,q,qb);
	input clk,rst;
	input j,k;
	output reg q;
	output qb;
	
	always@(posedge clk)
		begin
			if(rst)
				q <= 1'b0;
			else
				case({j,k})
					0: q <= q;
					1: q <= 1'b0;
					2: q <= 1'b1;
					3: q <= ~q;
				endcase
		end
	assign qb = ~q;
endmodule