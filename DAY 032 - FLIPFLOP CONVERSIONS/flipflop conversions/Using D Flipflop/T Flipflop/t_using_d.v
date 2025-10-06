module t_using_d(t,clk,rst,q,qb);
  	input t,clk,rst;
  	output q,qb;
  
  	wire w1;
  
 	xor x1(w1,t,q);
  
  	d_ff d1(w1,clk,rst,q,qb);
  
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