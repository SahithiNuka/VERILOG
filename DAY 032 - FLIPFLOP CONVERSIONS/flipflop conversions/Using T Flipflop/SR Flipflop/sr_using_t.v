module sr_using_t(s,r,clk,rst,q,qb);
  	input s,r,clk,rst;
  	output q,qb;
  
  	wire w1,w2,w3;
  
  	and a1(w1,s,qb);
  	and a2(w2,r,q);
  	or o1(w3,w1,w2);
  	
  	t_ff t1(w2,clk,rst,q,qb);
  
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