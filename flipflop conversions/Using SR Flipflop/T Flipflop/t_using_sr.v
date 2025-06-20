module t_using_sr(t,clk,rst,q,qb);
	input t,clk,rst;
  	output q,qb;
  	
  	wire w1,w2;
  
  	and a1(w1,t,qb);
  	and a2(w2,t,q);
	
  sr_ff s1(w1,w2,clk,rst,q,qb);
endmodule


module sr_ff(s,r,clk,rst,q,qb);
  	input s,r,clk,rst;
  	output reg q;
  	output qb;
  
  always@(posedge clk)
    	begin
          if(rst)
            	q <= 1'b0;
          else
            	begin
                  	case({s,r})
                    	0: q <= q;
                    	1: q <= 1'b0;
                    	2: q <= 1'b1;
                    	3: q <= 1'bx;
                  endcase
				end
        end
  	assign qb = ~q;
endmodule