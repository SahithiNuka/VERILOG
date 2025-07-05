module sync_up_counter(clk,rst,q);
	input clk,rst;
	output [2:0]q;
	
	wire w1;
	
	and a1(w1,q[1],q[0]);
	
	jk_ff j1(clk,rst,1'b1,1'b1,q[0]);
	jk_ff j2(clk,rst,q[0],q[0],q[1]);
	jk_ff j3(clk,rst,w1,w1,q[2]);
	
endmodule

module jk_ff(clk,rst,j,k,q);
	input clk,rst;
	input j,k;
	output reg q;
	
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
endmodule