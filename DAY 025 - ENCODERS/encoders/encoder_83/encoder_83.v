`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:28:09 05/13/2025 
// Design Name: 
// Module Name:    encoder_83 
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
module encoder_83(i,y);
   input [7:0] i;
   output reg[2:0] y;
	
	always@(*)
		begin
			case(i)
				1: y = 3'b000;
				2: y = 3'b001;
				4: y = 3'b010;
				8: y = 3'b011;
				16: y = 3'b100;
				32: y = 3'b101;
				64: y = 3'b110;
				128: y = 3'b111;
				default: y = 3'b000;
			endcase
		end
endmodule
