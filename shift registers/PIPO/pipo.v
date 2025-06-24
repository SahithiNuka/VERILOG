module pipo(pin,clk,rst,pout);
   input [3:0] pin;
   input clk,rst;
   output [3:0] pout;

	dff d1(pin[3],clk,rst,pout[3]);
	dff d2(pin[2],clk,rst,pout[2]);
	dff d3(pin[1],clk,rst,pout[1]);
	dff d4(pin[0],clk,rst,pout[0]);
	
endmodule


module dff(d,clk,rst,q);
	input d,clk,rst;
	output reg q;
	
	always@(posedge clk)
		begin
			if(rst)
				q<=1'b0;
			else
				q<=d;
		end
endmodule
