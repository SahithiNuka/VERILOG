`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:01:23 05/06/2025 
// Design Name: 
// Module Name:    demux_1x4 
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
module demux_1x4(i,s0,s1,y);
    input i,s0,s1;
    output reg [3:0] y;

	always@(*)
		begin
			case({s1,s0})
				0: y = {3'b0,i};
				1: y = {2'b0,i,1'b0};
				2: y = {1'b0,i,2'b0};
				3: y = {i,3'b0};
				default: y = 4'b0000;
			endcase
		end

endmodule
