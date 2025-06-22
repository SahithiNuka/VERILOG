//using behavioral modeling
module controlled_buffer_reg(clk,clr,load,x,q);
  	input clk,clr,load;
  	input [4:1]x;
  	output reg [4:1]q;
  
  	always@(posedge clk or posedge clr)
    	begin
          	if(clr)
            	q <= 4'b0;
          	else if(load)
            	q <= x;
          	else
            	q <= q;
        end
endmodule
