`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:56:15 03/24/2025 
// Design Name: 
// Module Name:    fs 
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
module fs(a,b,c,diff,borrow);
    input a, b, c;
    output diff, borrow;

	assign diff = a^b^c;
	assign borrow = (!a&b) | (b&c) | (!a&c);


endmodule
