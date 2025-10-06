module async_up_counter_negedge(clk,rst,q);
	input clk,rst;
	output [3:0]q;
	
	jk_ff j1(clk,rst,1'b1,1'b1,q[0]);
	jk_ff j2(q[0],rst,1'b1,1'b1,q[1]);
	jk_ff j3(q[1],rst,1'b1,1'b1,q[2]);
	jk_ff j4(q[2],rst,1'b1,1'b1,q[3]);
	
endmodule

module jk_ff(clk,rst,j,k,q);
	input clk,rst;
	input j,k;
	output reg q;
	
	always@(negedge clk or negedge rst)
		begin
			if(~rst)
				q<=0;
			else
				case({j,k})
					0: q <= q;
					1: q <= 0;
					2: q <= 1;
					3: q <= ~q;
				endcase
		end
endmodule