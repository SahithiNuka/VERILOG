// Code your design here
module universal_shift_reg(clk,rst_n,s1,s0,sr,sl,pdin,pdout);
	input clk,rst_n,s1,s0,sr,sl;
	input [3:0]pdin;
	output [3:0]pdout;
	
	wire w0,w1,w2,w3;
	
	mux_4x1 m0(pdout[0],pdout[1],sl,pdin[0],s1,s0,w0);
	mux_4x1 m1(pdout[1],pdout[2],pdout[0],pdin[1],s1,s0,w1);
	mux_4x1 m2(pdout[2],pdout[3],pdout[1],pdin[2],s1,s0,w2);
	mux_4x1 m3(pdout[3],sr,pdout[2],pdin[3],s1,s0,w3);
	
	d_ff d0(clk,rst_n,w0,pdout[0]);
	d_ff d1(clk,rst_n,w1,pdout[1]);
	d_ff d2(clk,rst_n,w2,pdout[2]);
	d_ff d3(clk,rst_n,w3,pdout[3]);
	
endmodule

module mux_4x1(i0,i1,i2,i3,s1,s0,y);
	input i0,i1,i2,i3;
	input s1,s0;
	output reg y;
	
	always@(*)
		begin
			case({s1,s0})
				0: y = i0;
				1: y = i1;
				2: y = i2;
				3: y = i3;
				default: y = i0;
			endcase
		end
endmodule

module d_ff(clk,rst_n,d,q);
	input clk,rst_n;
	input d;
	output reg q;
	
	always@(posedge clk or negedge rst_n)
		begin
			if(~rst_n)
				q <= 1'b0;
			else
				q <= d;
		end
endmodule