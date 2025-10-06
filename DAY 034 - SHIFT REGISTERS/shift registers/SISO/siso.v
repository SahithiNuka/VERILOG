
//siso right shift
module siso(sin,clk,rst,sout);
   input sin,clk,rst;
   output sout;

	wire w1,w2,w3;
	
	dff d1(sin,clk,rst,w1);
	dff d2(w1,clk,rst,w2);
	dff d3(w2,clk,rst,w3);
	dff d4(w3,clk,rst,sout);
	
endmodule

//siso left shift
module siso(sin,clk,rst,sout);
	input sin,clk,rst;
   output sout;

	wire w1,w2,w3;
	
	dff d1(w3,clk,rst,sout);
	dff d2(w2,clk,rst,w3);
	dff d3(w1,clk,rst,w2);
	dff d4(sin,clk,rst,w1);

endmodule

module dff(d,clk,rst,q);
	input d,clk,rst;
	output reg q;
	
	always@(posedge clk)
		begin
			if(rst)
				q <= 1'b0;
			else
				q <= d;
		end
endmodule

