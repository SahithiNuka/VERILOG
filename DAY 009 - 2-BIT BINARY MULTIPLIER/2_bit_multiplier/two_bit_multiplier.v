`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:57:01 03/27/2025 
// Design Name: 
// Module Name:    two_bit_multiplier 
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
module two_bit_multiplier(a,b,p);
    input [1:0] a,b;
    output [3:0] p;

	wire x1,x2,x3,x4;
	
	assign p[0] = a[0] & b[0];
	
	assign x1 = a[1] & b[0];
	assign x2 = a[0] & b[1];
	assign x3 = a[1] & b[1];
	
	ha h1(x1,x2,p[1],x4);
	ha h2(x3,x4,p[2],p[3]);
	
endmodule

module ha(a,b,sum,carry);
	input a,b;
	output sum,carry;
	
	assign sum = a^b;
	assign carry = a&b;
	
endmodule
