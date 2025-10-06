`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:16:15 05/21/2025 
// Design Name: 
// Module Name:    decoder_38 
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
module decoder_38(s,d);
    input [2:0] s;
    output reg[7:0] d;

	always@(*)
		begin
			case(s)
				0: d = 8'h01;
				1: d = 8'h02;
				2: d = 8'h04;
				3: d = 8'h08;
				4: d = 8'h10;
				5: d = 8'h20;
				6: d = 8'h40;
				7: d = 8'h80;
				default: d = 8'd0;
			endcase
		end	

endmodule
