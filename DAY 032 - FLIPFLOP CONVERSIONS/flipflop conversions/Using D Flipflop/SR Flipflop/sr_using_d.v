module sr_using_d(s,r,clk,rst,q,qb);
  	input s,r,clk,rst;
  	output q,qb;
  
  	wire w1,w2,w3;
  
  	not n1(w1,r);
  	and a1(w2,w1,q);
  	or o1(w3,s,w2);
  
  	d_ff(w3,clk,rst,q,qb);
  
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