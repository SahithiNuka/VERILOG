`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:21:39 03/24/2025 
// Design Name: 
// Module Name:    fa_using_hs 
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
module fa_using_hs(a,b,c,sum,carry);
    input a,b,c;
    output sum,carry;
	
	wire w1,w2,w3,w4,w5;
	
	assign w1 = !a;
	hs h1(w1,b,w2,w3);
	hs h2(w2,c,w4,w5);
	
	assign sum = !w4;
	or o1(carry,w3,w5);

endmodule


module hs(a,b,diff,borrow);
	input a,b;
	output diff,borrow;
	
	assign diff = a^b;
	assign borrow = !a & b;
	
endmodule
