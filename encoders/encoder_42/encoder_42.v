`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:50:05 05/15/2025 
// Design Name: 
// Module Name:    encoder_42 
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
module encoder_42(i,y);
    input [3:0] i;
    output reg[1:0] y;

	always@(*)
		begin
			case(i)
				1: y = 2'b00;
				2: y = 2'b01;
				4: y = 2'b10;
				8: y = 2'b11;
				default: y = 2'b00;
			endcase
		end

endmodule
