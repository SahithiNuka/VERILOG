`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:42:00 03/24/2025 
// Design Name: 
// Module Name:    ha 
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
module ha(a,b,sum,carry);
    input a, b;
    output sum, carry;
	
	assign sum = a^b;
	assign carry = a&b;

endmodule
