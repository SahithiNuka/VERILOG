`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:27:33 03/27/2025 
// Design Name: 
// Module Name:    cla_adder 
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
module cla_adder(a,b,cin,s,c3);
    input [3:0] a,b;
    input cin;
    output [3:0] s;
    output c3;

	wire p0,p1,p2,p3,g0,g1,g2,g3,c0,c1,c2;
	
	xor x1(p0,a[0],b[0]);
	xor x2(p1,a[1],b[1]);
	xor x3(p2,a[2],b[2]);
	xor x4(p3,a[3],b[3]);
	
	and a1(g0,a[0],b[0]);
	and a2(g1,a[1],b[1]);
	and a3(g2,a[2],b[2]);
	and a4(g3,a[3],b[3]);
	
	assign c0 = g0 | (p0 & cin);
	assign c1 = g1 | (p1 & c0);
	assign c2 = g2 | (p2 & c1);
	assign c3 = g3 | (p3 & c2);
	
	assign s[0] = p0 ^ cin;
	assign s[1] = p1 ^ c0;
	assign s[2] = p2 ^ c1;
	assign s[3] = p3 ^ c2;

endmodule
