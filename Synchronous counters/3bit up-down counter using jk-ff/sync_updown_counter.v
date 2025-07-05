module sync_updown_counter(clk,rst,m,q);
	input clk,rst,m;
	output [2:0]q;
	
	wire [2:0]qb;
	wire [5:0]w;
	wire a;
	
	not n1(a,m);
	and a1(w[0],qb[0],a); //q0'.m'
	and a2(w[1],q[0],m); //q0.m
	or o1(w[2],w[0],w[1]); //w[2]=q0'.m' + q0.m ===> j1,k1
	
	and a3(w[3],w[0],qb[1]); //q1'.q0'.m'
	and a4(w[4],w[1],q[1]); //q1.q0.m
	or o2(w[5],w[3],w[4]); //w[5] = q1'.q0'.m' + q1.q0.m ===> j2,k2
	
	jk_ff j1(clk,rst,1'b1,1'b1,q[0],qb[0]);
	jk_ff j2(clk,rst,w[2],w[2],q[1],qb[1]);
	jk_ff j3(clk,rst,w[5],w[5],q[2],qb[2]);
	
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