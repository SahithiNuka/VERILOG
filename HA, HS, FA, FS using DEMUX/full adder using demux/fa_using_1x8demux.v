`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:05:13 05/13/2025 
// Design Name: 
// Module Name:    fa_using_1x8demux 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module fa_using_1x8demux(a,b,cin,sum,cout);
   input a,b,cin;
   output sum,cout;
	
	wire [7:0]y;
	demux_1x8 d1(1'b1,a,b,cin,y[7:0]);
	
	or o1(sum,y[1],y[2],y[4],y[7]);
	or o2(cout,y[3],y[5],y[6],y[7]);

endmodule


module demux_1x8(input i,s2,s1,s0,
						output reg [7:0]y);
						
	always@(*)
		begin
			case({s2,s1,s0})
				0: y = {7'b0,i};
				1: y = {6'b0,i,1'b0};
				2: y = {5'b0,i,2'b0};
				3: y = {4'b0,i,3'b0};
				4: y = {3'b0,i,4'b0};
				5: y = {2'b0,i,5'b0};
				6: y = {1'b0,i,6'b0};
				7: y = {i,7'b0};
				default: y = 8'b0000_0000;
			endcase
		end
endmodule
