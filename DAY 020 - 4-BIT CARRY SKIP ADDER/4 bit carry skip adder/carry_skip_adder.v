`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:18:49 05/09/2025 
// Design Name: 
// Module Name:    carry_skip_adder 
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
module carry_skip_adder(a,b,c0,s,cout);
	input [3:0]a,b;
	input c0;
	output [3:0]s;
	output cout;
	
	wire p0,p1,p2,p3;
	wire w1;
	wire c1,c2,c3,c4;
	
	full_adder f1(a[0],b[0],c0,s[0],c1);
	full_adder f2(a[1],b[1],c1,s[1],c2);
	full_adder f3(a[2],b[2],c2,s[2],c3);
	full_adder f4(a[3],b[3],c3,s[3],c4);
	
	assign p0 = a[0] ^ b[0],
			p1 = a[1] ^ b[1],
			p2 = a[2] ^ b[2],
			p3 = a[3] ^ b[3];
			
	and a1(w1,p0,p1,p2,p3);
	
	mux_2x1 m1(c4,c0,w1,cout);
	
endmodule

module full_adder(a,b,cin,sum,co);
	input a,b,cin;
	output sum,co;
	
	assign sum = a^b^cin;
	assign co = (a&b) | (b&cin) | (a&cin);
endmodule

module mux_2x1(a,b,s,y);
	input a,b,s;
	output y;
	
	assign y = (!s&a) | (s&b);
endmodule

