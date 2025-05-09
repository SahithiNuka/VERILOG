`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:12:44 05/09/2025 
// Design Name: 
// Module Name:    mux_Kx1 
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
module mux_Kx1#(parameter K = 64)(input [K-1:0]i,
					input [5:0]s, output reg y);
					
	integer j;
	always@(*)
		begin
			for(j=0; j<K; j=j+1)
				begin
					case(s)
						j: y = i[j];
					endcase
				end
		end
endmodule
