`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:07:41 03/24/2025 
// Design Name: 
// Module Name:    fa_using_ha 
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
module fa_using_ha(a,b,c,sum,carry);
    input a,b,c;
    output sum, carry;

	wire w1,w2,w3;
	
	ha h1(a,b,w1,w2);
	ha h2(w1,c,sum,w3);
	or o1(carry,w2,w3);
	
endmodule



module ha(a,b,sum,carry);
	input a,b;
	output sum,carry;
	
	assign sum = a^b;
	assign carry = a&b;
	
endmodule
