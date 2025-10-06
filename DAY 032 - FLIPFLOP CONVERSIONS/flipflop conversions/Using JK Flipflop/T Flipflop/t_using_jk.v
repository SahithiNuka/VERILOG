module t_using_jk(t,clk,rst,q,qb);
  	input t,clk,rst;
  	output q,qb;
  	
  	jk_ff j1(t,t,clk,rst,q,qb);
  
endmodule
module jk_ff(j,k,clk,rst,q,qb);
	input j,k,clk,rst;
	output reg q,qb;
  
	always@(posedge clk)
		begin
			if(rst)
				begin
					q <= 1'b0;
                  	qb <= 1'b1; 
				end
			else
              	begin
                  case({j,k})
                    0: {q,qb} <= {q,qb};
                    1: {q,qb} <= {2'b01};
                    2: {q,qb} <= {2'b10};
                    3: {q,qb} <= {qb,q};
                  endcase
                end
		end
  	
endmodule