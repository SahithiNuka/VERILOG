`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:06:27 03/27/2025 
// Design Name: 
// Module Name:    b_to_g 
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
module b_to_g(b,g);
    input [3:0] b;
    output [3:0] g;

	assign g[3] = b[3];
	xor x1(g[2],b[3],b[2]);
	xor x2(g[1],b[2],b[1]);
	xor x3(g[0],b[1],b[0]);
	

endmodule
