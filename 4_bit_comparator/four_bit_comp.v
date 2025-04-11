`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:24:35 04/11/2025 
// Design Name: 
// Module Name:    four_bit_comp 
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
module four_bit_comp(a,b,gt,lt,eq);
    input [3:0] a,b;
    output gt,lt,eq;

	wire w1,w2,w3,w4,w5,w6,w7,w8;
	
	not n1(w1,a[0]);
	not n2(w2,a[1]);
	not n3(w3,a[2]);
	not n4(w4,a[3]);
	
	not n5(w5,b[0]);
	not n6(w6,b[1]);
	not n7(w7,b[2]);
	not n8(w8,b[3]);
	
	assign gt = (a[3]&w8) | ((a[3]^~b[3]) & (a[2]&w7)) | ((a[3]^~b[3]) & (a[2]^~b[2]) & (a[1]&w6)) | ((a[3]^~b[3]) & (a[2]^~b[2]) & (a[1]^~b[1]) & (a[0]&w5));
	assign lt = (w4&b[3]) | ((a[3]^~b[3]) & (w3&b[2])) | ((a[3]^~b[3]) & (a[2]^~b[2]) & (w2&b[1])) | ((a[3]^~b[3]) & (a[2]^~b[2]) & (a[1]^~b[1]) & (w1&b[0]));
	assign eq = (a[3]^~b[3]) & (a[2]^~b[2]) & (a[1]^~b[1]) & (a[0]^~b[0]);

endmodule
