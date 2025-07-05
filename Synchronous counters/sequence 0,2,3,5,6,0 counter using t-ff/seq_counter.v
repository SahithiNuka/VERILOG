module seq_counter(clk,rst,q); //0,2,3,5,6,0,2,...
	input clk,rst;
	output [2:0]q;
	
	wire [2:0]qb;
	wire [6:0]w;
	
	and a1(w[0],qb[1],q[0]); //q1'.q0
	and a2(w[1],qb[2],q[1],qb[0]); //q2'.q1.q0'
	or o1(w[2],w[0],w[1]); //q1'.q0 + q2'.q1.q0' ====> t0
	
	or o2(w[3],q[2],qb[1],q[0]); //q2 + q1' + q0 ====> t1
	
	and a3(w[4],qb[2],q[0]); //q2'.q0
	and a4(w[5],q[2],q[1]); //q2.q1
	or o3(w[6],w[4],w[5]); //q2'.q0 + q2.q1 ====> t2
	
	t_ff t1(clk,rst,w[2],q[0],qb[0]);
	t_ff t2(clk,rst,w[3],q[1],qb[1]);
	t_ff t3(clk,rst,w[6],q[2],qb[2]);

endmodule

module t_ff(clk,rst,t,q,qb);
	input clk,rst,t;
	output reg q;
	output qb;
	
	always@(posedge clk)
		begin
			if(rst)
				q <= 1'b0;
			else
				begin
					case(t)
						0: q <= q;
						1: q <= ~q;
					endcase
				end
		end
	assign qb = ~q;
endmodule