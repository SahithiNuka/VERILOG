`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:41:22 03/28/2025 
// Design Name: 
// Module Name:    carry_select_adder 
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
module carry_select_adder(a,b,cin,sum,cout);
    input [3:0] a,b;
    input cin;
    output [3:0] sum;
    output cout;
	
	wire [7:0]c,s;
	
	//full adders at rca stage 1
	fa f1(a[0],b[0],0,s[0],c[0]);
	fa f2(a[1],b[1],c[0],s[1],c[1]);
	fa f3(a[2],b[2],c[1],s[2],c[2]);
	fa f4(a[3],b[3],c[2],s[3],c[3]);
	
	//full adders at rca stage 2
	fa f5(a[0],b[0],1,s[4],c[4]);
	fa f6(a[1],b[1],c[4],s[5],c[5]);
	fa f7(a[2],b[2],c[5],s[6],c[6]);
	fa f8(a[3],b[3],c[6],s[7],c[7]);
	
	//multiplexers
	mux_21 m1(s[0],s[4],cin,sum[0]);
	mux_21 m2(s[1],s[5],cin,sum[1]);
	mux_21 m3(s[2],s[6],cin,sum[2]);
	mux_21 m4(s[3],s[7],cin,sum[3]);
	
	//final mux
	mux_21 m5(c[3],c[7],cin,cout);

endmodule


module fa(a,b,c,s,co);
	input a,b,c;
	output s,co;

	assign s = a^b^c;
	assign co = (a&b) | (b&c) |(a&c);
	
endmodule

/*
module rca(a,b,c,s,co);
	input [3:0]a,b;
	input c;
	output [3:0]s;
	output co;
	
	wire c0,c1,c2;
	fa f1(a[0],b[0],c,s[0],c0);
	fa f2(a[1],b[1],c0,s[1],c1);
	fa f3(a[2],b[2],c1,s[2],c2);
	fa f3(a[3],b[3],c2,s[3],co);
	
endmodule
*/

module mux_21(a,b,s,y);
	input a,b,s;
	output y;

	assign y = (!s&a) | (s&b);
endmodule

























