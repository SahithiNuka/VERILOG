module seq2_gen(clk,rst,qout);
	input clk,rst;
	output qout;
	
	wire [2:1]q;
	wire [2:0]qb;
	wire [3:0]w;
	
	or o1(w[0],qb[1],q[2]); //k0
	
	and a1(w[1],qb[2],qb[0]);
	and a2(w[2],q[2],qout);
	or o2(w[3],w[1],w[2]); //j1
	
	jk_ff j1(clk,rst,1'b1,w[0],qout,qb[0]);
	jk_ff j2(clk,rst,w[3],qout,q[1],qb[1]);
	jk_ff j3(clk,rst,q[1],qb[1],q[2],qb[2]);
	
endmodule

module jk_ff(clk,rst,j,k,q,qb);
	input clk,rst;
	input j,k;
	output reg q;
	output qb;
	
	always@(posedge clk)
		begin
			if(rst)
				q <= 1'b1;
			else
				begin
					case({j,k})
						0: q <= q;
						1: q <= 1'b0;
						2: q <= 1'b1;
						3: q <= ~q;
					endcase
				end
		end
	assign qb = ~q;
endmodule