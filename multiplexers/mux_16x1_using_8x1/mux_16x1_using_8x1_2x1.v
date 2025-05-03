`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:27:20 04/18/2025 
// Design Name: 
// Module Name:    mux_16x1_using_8x1_2x1 
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
module mux_16x1_using_8x1_2x1(
    input [15:0] i,
    input s0,s1,s2,s3,
    output y
    );

	wire w1,w2;
	
	mux8x1 m1(i[7:0],s0,s1,s2,w1);
	mux8x1 m2(i[15:8],s0,s1,s2,w2);
	
	mux2x1 m3(w1,w2,s3,y);

endmodule

module mux8x1(input [7:0] i,
    input s0,s1,s2,
    output y);

	assign y = ((!s2)&(!s1)&(!s0)&i[0]) |
					((!s2)&(!s1)&(s0)&i[1]) |
					((!s2)&(s1)&(!s0)&i[2]) |
					((!s2)&(s1)&(s0)&i[3]) |
					((s2)&(!s1)&(!s0)&i[4]) |
					((s2)&(!s1)&(s0)&i[5]) |
					((s2)&(s1)&(!s0)&i[6]) |
					((s2)&(s1)&(s0)&i[7]);

endmodule

module mux2x1(a,b,s,y);
	input a,b,s;
	output y;
	
	assign y = !s&a | s&b;
	
endmodule
