`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:51:59 05/06/2025 
// Design Name: 
// Module Name:    demux_1x2 
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
module demux_1x2(i,s,y0,y1);
    input i,s;
    output y0,y1;

	assign y0 = !s & i;
	assign y1 = s & i;

endmodule
