module sipo(sin,clk,rst,pout);
	input sin,clk,rst;
	output [3:0]pout;

	wire [2:0]w;
	
	dff d1(sin,clk,rst,w[2]);
	dff d2(w[2],clk,rst,w[1]);
	dff d3(w[1],clk,rst,w[0]);
	dff d4(w[0],clk,rst,pout[0]);
	
	assign pout[3:1] = w[2:0];

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
