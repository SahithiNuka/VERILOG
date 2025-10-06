module d_using_t(d,clk,rst,q,qb);
  	input d,clk,rst;
  	output q,qb;
  
  	wire w1;
  
  	xor x1(w1,d,q);
  
  	t_ff t1(w1,clk,rst,q,qb);
  	
endmodule

module t_ff(t,clk,rst,q,qb);
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