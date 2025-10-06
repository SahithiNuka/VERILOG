`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:58:58 04/11/2025 
// Design Name: 
// Module Name:    two_bit_using_one_bit_comp 
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
module two_bit_using_one_bit_comp(a,b,gt,lt,eq);
    input [1:0] a,b;
    output gt,lt,eq;

	wire w1,w2,w3,w4,w5,w6,w7,w8;
	
	one_bit_comp c1(a[1],b[1],w1,w2,w3);
	one_bit_comp c2(a[0],b[0],w4,w5,w6);
	
	assign eq = w2 & w5;
	and a1(w7,w4,w2);
	and a2(w8,w6,w2);
	
	assign lt = w1 | w7;
	assign gt = w3 | w8;
	
endmodule


module one_bit_comp(a,b,lt,eq,gt);
	input a,b;
	output gt,lt,eq;
	
	wire w1,w2;
	
	not n1(w1,a);
	not n2(w2,b);
	
	assign gt = a&w2;
	assign lt = w1&b;
	assign eq = a ^~ b;
endmodule

