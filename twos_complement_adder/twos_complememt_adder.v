`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:48:47 03/26/2025 
// Design Name: 
// Module Name:    twos_complememt_adder 
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
module twos_complememt_adder(a,b,m,sum,cout);
    input [3:0] a,b;
    input m;
    output [3:0] sum;
    output cout;

	wire w1,w2,w3,w4,c1,c2,c3;
	
	xor x0(w1,b[0],m);
	xor x1(w2,b[1],m);
	xor x2(w3,b[2],m);
	xor x3(w4,b[3],m);
	
	fa f1(a[0],w1,m,sum[0],c1);
	fa f2(a[1],w2,c1,sum[1],c2);
	fa f3(a[2],w3,c2,sum[2],c3);
	fa f4(a[3],w4,c3,sum[3],cout);

endmodule


module fa(a,b,c,sum,carry);
	input a,b,c;
	output sum,carry;
	
	assign sum = a^b^c;
	assign carry = (a&b) | (b&c) | (a&c);
	
endmodule
