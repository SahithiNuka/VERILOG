`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:38:43 04/18/2025 
// Design Name: 
// Module Name:    mux_8x1_using_4x1_2x1 
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
module mux_8x1_using_4x1_2x1(i,s0,s1,s2,y);
    input [7:0] i;
    input s0,s1,s2;
    output y;
	 
	 wire w1,w2;
	 
	 mux4x1 m1(i[0],i[1],i[2],i[3],s0,s1,w1);
	 mux4x1 m2(i[4],i[5],i[6],i[7],s0,s1,w2);
	 
	 mux2x1 m3(w1,w2,s2,y);
	
endmodule

module mux2x1(a,b,s,y);
	input a,b;
	input s;
	output y;
	
	assign y = !s&a | s&b;
endmodule

module mux4x1(a,b,c,d,s0,s1,y);
	input a,b,c,d;
	input s0,s1;
	output y;
	
	assign y = (!s1)&(!s0)&a |
					(!s1)&(s0)&b |
					(s1)&(!s0)&c |
					(s1)&(s0)&d;
endmodule

	