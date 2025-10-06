`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:10:54 04/11/2025 
// Design Name: 
// Module Name:    two_bit_comp 
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
module two_bit_comp(a,b,gt,lt,eq);
    input [1:0] a,b;
    output gt,lt,eq;

	wire w1,w2,w3,w4;
	
	not n1(w1,a[0]);
	not n2(w2,a[1]);
	not n3(w3,b[0]);
	not n4(w4,b[1]);
	
	assign gt = (a[1]&w4) | ((a[1] ^~ b[1]) & (a[0]&w3));
	assign lt = (w2&b[1]) | ((a[1] ^~ b[1]) & (w1&b[0]));
	assign eq = (a[1] ^~ b[1]) & (a[0] ^~ b[0]);

endmodule
