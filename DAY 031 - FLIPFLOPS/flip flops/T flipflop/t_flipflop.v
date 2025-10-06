module t_flipflop(t,clk,rst,q,qb);
  	input t,clk,rst;
  	output reg q;
  	output qb;
  
  	always@(posedge clk)
    	begin
     		if(rst)
        		q <= 1'b0;
      		else
        		q <= ~t;
    	end
  	assign qb = ~q;
endmodule