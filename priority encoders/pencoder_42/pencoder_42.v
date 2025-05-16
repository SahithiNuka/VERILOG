`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:49:31 05/16/2025 
// Design Name: 
// Module Name:    pencoder_42 
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
module pencoder_42(i,y);
    input [3:0] i;
    output reg[1:0] y;

	always@(i)
		begin
			if(i[3])
				y = 2'b11;
			else if(i[2])
				y = 2'b10;
			else if(i[1])
				y = 2'b01;
			else if(i[0])
				y = 2'b00;
			else
				y = 2'bxx;
		end		
endmodule
