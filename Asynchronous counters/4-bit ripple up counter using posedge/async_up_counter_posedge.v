module async_up_counter_posedge(clk,rst,q);
	input clk,rst;
	output [3:0]q;
	
	wire [3:0]w;
	
	jk_ff j1(clk,rst,1'b1,1'b1,q[0],w[0]);
	jk_ff j2(w[0],rst,1'b1,1'b1,q[1],w[1]);
	jk_ff j3(w[1],rst,1'b1,1'b1,q[2],w[2]);
	jk_ff j4(w[2],rst,1'b1,1'b1,q[3],w[3]);
	
endmodule

module jk_ff(clk,rst,j,k,q,qb);
	input clk,rst;
	input j,k;
	output reg q;
	output qb;
	
	always@(posedge clk or posedge rst)
		begin
			if(rst)
				q<=0;
			else
				case({j,k})
					0: q <= q;
					1: q <= 0;
					2: q <= 1;
					3: q <= ~q;
				endcase
		end
	assign qb = ~q;
endmodule