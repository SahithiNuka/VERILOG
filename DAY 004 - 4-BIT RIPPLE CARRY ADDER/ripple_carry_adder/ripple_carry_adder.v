`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:24:36 03/26/2025 
// Design Name: 
// Module Name:    ripple_carry_adder 
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
module ripple_carry_adder(a,b,cin,sum,cout);
    input [3:0] a,b;
    output [3:0] sum;
    input cin;
    output cout;

	wire c0,c1,c2;
	//assign cin = 0;
	fa f1(a[0],b[0],cin,sum[0],c0);
	fa f2(a[1],b[1],c0,sum[1],c1);
	fa f3(a[2],b[2],c1,sum[2],c2);
	fa f4(a[3],b[3],c2,sum[3],cout);

endmodule



module fa(a,b,c,sum,carry);
	input a,b,c;
	output sum,carry;
	
	assign sum = a^b^c;
	assign carry = (a&b) | (b&c) | (a&c);
	
endmodule
