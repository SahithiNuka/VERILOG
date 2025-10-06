`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:59:38 05/16/2025 
// Design Name: 
// Module Name:    pencoder_83 
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
module pencoder_83(i,y);
    input [7:0] i;
    output reg[2:0] y;

	always@(i)
		begin
			case(1)
				i[7]: y = 3'b111;
				i[6]: y = 3'b110;
				i[5]: y = 3'b101;
				i[4]: y = 3'b100;
				i[3]: y = 3'b011;
				i[2]: y = 3'b010;
				i[1]: y = 3'b001;
				i[0]: y = 3'b000;
				default: y = 3'bxxx;
			endcase
		end
endmodule
