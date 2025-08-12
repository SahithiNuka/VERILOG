module seq2_gen(clk,rst,f);
	input clk,rst;
	output f;
	
	wire [2:0]q,qb;
	wire w1,w2;
	
	and a1(w1,q[0],q[1]); //j2
	
	jk_ff j1(clk,rst,qb[2],1'b1,q[0],qb[0]);
	jk_ff j2(clk,rst,q[0],q[0],q[1],qb[1]);
	jk_ff j3(clk,rst,w1,1'b1,q[2],qb[2]);
	
	and a2(w2,qb[0],qb[2]);
	
	or o1(f,q[1],w2);
	
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