`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:07:56 05/08/2025 
// Design Name: 
// Module Name:    demux_1x16_using_1x4 
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
module demux_1x16_using_1x4(i,s3,s2,s1,s0,y);
    input i,s3,s2,s1,s0;
    output [15:0] y;

	wire w1,w2,w3,w4;
	
	demux_1x4 d1(i,s3,s2,w4,w3,w2,w1);
	demux_1x4 d2(w1,s1,s0,y[3],y[2],y[1],y[0]);
	demux_1x4 d3(w2,s1,s0,y[7],y[6],y[5],y[4]);
	demux_1x4 d4(w3,s1,s0,y[11],y[10],y[9],y[8]);
	demux_1x4 d5(w4,s1,s0,y[15],y[14],y[13],y[12]);
endmodule

module demux_1x4(i,s1,s0,a,b,c,d);
	input i,s1,s0;
	output reg a,b,c,d;
	
	always@(*)
		begin
			case({s1,s0})
				0: {a,b,c,d} = {3'b0,i};
				1: {a,b,c,d} = {2'b0,i,1'b0};
				2: {a,b,c,d} = {1'b0,i,2'b0};
				3: {a,b,c,d} = {i,3'b0};
				default: {a,b,c,d} = 4'b0000;
			endcase
		end
endmodule
	
