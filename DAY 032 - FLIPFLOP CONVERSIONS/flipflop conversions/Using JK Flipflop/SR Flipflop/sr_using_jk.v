module sr_using_jk(s,r,clk,rst,q,qb);
	input s,r,clk,rst;
  	output q,qb;
  
  	jk_ff j1(s,r,clk,rst,q,qb);	
  
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