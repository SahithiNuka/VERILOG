`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:36:14 05/13/2025 
// Design Name: 
// Module Name:    encoder_16_4 
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
module encoder_16_4(i,y);
    input [15:0] i;
    output reg[3:0] y;

	always@(*)
		begin
			case(i)
				1: y = 4'b0000;
				2: y = 4'b0001;
				4: y = 4'b0010;
				8: y = 4'b0011;
				16: y = 4'b0100;
				32: y = 4'b0101;
				64: y = 4'b0110;
				128: y = 4'b0111;
				256: y = 4'b1000;
				512: y = 4'b1001;
				1024: y = 4'b1010;
				2048: y = 4'b1011;
				4096: y = 4'b1100;
				8192: y = 4'b1101;
				16384: y = 4'b1110;
				32768: y = 4'b1111;
				default: y = 4'b0000;
			endcase
		end

endmodule
