module sync_down_counter(clk,rst,q);
	input clk,rst;
	output [2:0]q;
	
	wire w1;
	wire [2:0]qb;
	
	and a1(w1,qb[1],qb[0]);
	
	t_ff t1(clk,rst,1'b1,q[0],qb[0]);
	t_ff t2(clk,rst,qb[0],q[1],qb[1]);
	t_ff t3(clk,rst,w1,q[2],qb[2]);
	
endmodule

module t_ff(clk,rst,t,q,qb);
	input clk,rst;
	input t;
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