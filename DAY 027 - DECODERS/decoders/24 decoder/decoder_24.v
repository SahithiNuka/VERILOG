`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:02:00 05/21/2025 
// Design Name: 
// Module Name:    decoder_24 
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
module decoder_24(y,i);
    input [1:0] y
    output reg[3:0] i;

	always@(*)
		case(y)
			0: i = 4'b0001;
			1: i = 4'b0010;
			2: i = 4'b0100;
			3: i = 4'b1000;
			default: i = 4'b0000;
		endcase

endmodule
