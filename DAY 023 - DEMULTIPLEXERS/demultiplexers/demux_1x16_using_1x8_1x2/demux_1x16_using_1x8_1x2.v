`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:34:45 05/09/2025 
// Design Name: 
// Module Name:    demux_1x16_using_1x8_1x2 
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
module demux_1x16_using_1x8_1x2(i,s3,s2,s1,s0,y);
    input i,s3,s2,s1,s0;
    output [15:0] y;

	wire w1,w2;
	
	demux_1x2 d1(i,s3,w1,w2);
	demux_1x8 d2(w1,s2,s1,s0,y[7:0]);
	demux_1x8 d3(w2,s2,s1,s0,y[15:8]);

endmodule

module demux_1x2(i,s,a,b);
	input i,s;
	output a,b;
	
	assign a = !s&i,
			 b = s&i;
endmodule

module demux_1x8(
	input i,s2,s1,s0,
	output reg [7:0]y);
	//reg [7:0]y;
	
	always@(*)
		begin
			case({s2,s1,s0})
				0: y = {7'b0,i};
				1: y = {6'b0,i,1'b0};
				2: y = {5'b0,i,2'b0};
				3: y = {4'b0,i,3'b0};
				4: y = {3'b0,i,4'b0};
				5: y = {2'b0,i,5'b0};
				6: y = {1'b0,i,6'b0};
				7: y = {i,7'b0};
				default: y = 8'b00000000;
			endcase
		end
endmodule

	