`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:45:39 03/24/2025 
// Design Name: 
// Module Name:    hs 
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
module hs(a, b, diff, borrow);
    input a, b;
    output diff, borrow;
	
	assign diff = a^b;
	assign borrow = !a & b;

endmodule
