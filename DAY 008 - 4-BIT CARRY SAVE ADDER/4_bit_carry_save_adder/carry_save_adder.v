`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:39:33 03/30/2025 
// Design Name: 
// Module Name:    carry_savve_adder 
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
module carry_savve_adder(x,y,z,sum,cout);
    input [3:0] x,y,z;
    output [4:0] sum;
    output cout;
	 
	 wire [3:1]s;
	 wire [6:0]c;

	fa f1(x[0],y[0],z[0],sum[0],c[0]);
	fa f2(x[1],y[1],z[1],s[1],c[1]);
	fa f3(x[2],y[2],z[2],s[2],c[2]);
	fa f4(x[3],y[3],z[3],s[3],c[3]);
	
	fa f5(s[1],c[0],1'b0,sum[1],c[4]);
	fa f6(s[2],c[1],c[4],sum[2],c[5]);
	fa f7(s[3],c[2],c[5],sum[3],c[6]);
	fa f8(1'b0,c[3],c[6],sum[4],cout);
	
endmodule


module fa(a,b,c,s,co);
	input a,b,c;
	output s,co;
	
	assign s=a^b^c;
	assign co=(a&b)|(b&c)|(a&c);
endmodule
