
module jk_using_sr(j,k,clk,rst,q,qb);
	input j,k,clk,rst;
  	output q,qb;
  
  	wire w1,w2;
  
  	and a1(w1,j,qb);
  	and a2(w2,k,q);
  
  	sr_ff s1(w1,w2,clk,rst,q,qb);
endmodule


module sr_ff(s,r,clk,rst,q,qb);
  	input s,r,clk,rst;
  	output reg q;
  	output qb;
  
  always@(posedge clk)
    	begin
          if(rst)
            	q = 1'b0;
          else if(s==1'b0 && r==1'b0)
				begin
					q <= q;
				end
			else if(s==1'b0 && r==1'b1)
				begin
					q <= 1'b0;
				end
			else if(s==1'b1 && r==1'b0)
				begin
					q <= 1'b1;
				end
			else if(s==1'b1 && r==1'b1)
				begin
					q <= 1'bx;
				end
		end
  	assign qb = ~q;
endmodule