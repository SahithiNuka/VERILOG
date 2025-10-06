module jk_using_t(j,k,clk,rst,q,qb);
  	input j,k,clk,rst;
  	output q,qb;
  
  	wire w1,w2,w3;
  
  	and a1(w1,j,qb);
  	and a2(w2,k,q);
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