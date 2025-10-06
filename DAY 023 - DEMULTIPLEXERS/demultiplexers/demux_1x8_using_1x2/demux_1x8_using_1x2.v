`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:35:14 05/08/2025 
// Design Name: 
// Module Name:    demux_1x8_using_1x2 
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
module demux_1x8_using_1x2(i,s2,s1,s0,y);
    input i,s2,s1,s0;
    output [7:0] y;

	wire w1,w2,w3,w4,w5,w6;
	
	demux_1x2 d1(i,s2,w1,w2);
	demux_1x2 d2(w1,s1,w3,w4);
	demux_1x2 d3(w2,s1,w5,w6);
	demux_1x2 d4(w3,s0,y[0],y[1]);
	demux_1x2 d5(w4,s0,y[2],y[3]);
	demux_1x2 d6(w5,s0,y[4],y[5]);
	demux_1x2 d7(w6,s0,y[6],y[7]);

endmodule

module demux_1x2(i,s,a,b);
	input i,s;
	output a,b;
	
	assign a = !s & i;
	assign b = s & i;
endmodule
