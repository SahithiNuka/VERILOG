module d_using_sr(d,clk,rst,q,qb);
	input d,clk,rst;
  	output q,qb;
  	
  	wire w1;
  
  	not n1(w1,d);
	
  	sr_ff s1(d,w1,clk,rst,q,qb);
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