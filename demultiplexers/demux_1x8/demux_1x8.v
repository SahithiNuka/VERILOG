`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:27:49 05/06/2025 
// Design Name: 
// Module Name:    demux_1x8 
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
module demux_1x8(i,s0,s1,s2,y);
   input i;
   input s0,s1,s2;
	output reg[7:0] y;
	
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
