module buffer_reg(clk,rst,x,q);
	input clk,rst;
  	input [3:0]x;
  	output [3:0]q;
  
  	d_ff d1(clk,rst,x[0],q[0]);
  	d_ff d2(clk,rst,x[1],q[1]);
    d_ff d3(clk,rst,x[2],q[2]);
  	d_ff d4(clk,rst,x[3],q[3]);
  
endmodule


module d_ff(clk,rst,d,q);
  	input clk,rst,d;
  	output reg q;
  
  	always@(posedge clk)
    	begin
        	if(rst)
            	q <= 1'b0;
          	else 
            	q <= d;
        end
endmodule
          	