module jk_using_d(j,k,clk,rst,q,qb);
  	input j,k,clk,rst;
  	output q,qb;
  
  	wire w1,w2,w3,w4;
  
  	not n1(w1,k);
  	and a1(w2,j,qb);
  	and a2(w3,w1,q);
  	or o1(w4,w2,w3);
  
  	d_ff d1(w4,clk,rst,q,qb);
  
endmodule


module d_ff(d,clk,rst,q,qb);
	input d,clk,rst;
  	output reg q;
  	output qb;
  
  	always@(posedge clk)
    	begin
     		if(rst)
        		q <= 1'b0;
      		else
        		q <= d;
    	end
  	assign qb = ~q;
endmodule