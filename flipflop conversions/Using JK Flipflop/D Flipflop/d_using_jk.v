module d_using_jk(d,clk,rst,q,qb);
  	input d,clk,rst;
  	output q,qb;
  
  	wire w1;
  	not n1(w1,d);
	
  	jk_ff j1(d,w1,clk,rst,q,qb);
endmodule
module jk_ff(j,k,clk,rst,q,qb);
	input j,k,clk,rst;
	output reg q;
  	output qb;
  
	always@(posedge clk)
		begin
			if(rst)
				begin
					q <= 1'b0;
				end
			else if(j==1'b0 && k==1'b0)
				begin
					q <= q;
				end
			else if(j==1'b0 && k==1'b1)
				begin
					q <= 1'b0;
				end
			else if(j==1'b1 && k==1'b0)
				begin
					q <= 1'b1;
				end
			else if(j==1'b1 && k==1'b1)
				begin
					q <= ~q;
				end
		end
  	assign qb = ~q;
endmodule