`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:15:47 05/05/2025 
// Design Name: 
// Module Name:    fa_using_mux 
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
module fa_using_mux(a,b,cin,sum,cout);
   input a,b,cin;
	output sum,cout;

	wire w1;
	
	not n1(w1,cin);
	mux_4x1 m1(cin,w1,w1,cin,b,a,sum);
	mux_4x1 m2(1'b0,cin,cin,1'b1,b,a,cout);

endmodule


module mux_4x1(a,b,c,d,s0,s1,y);
	input a,b,c,d;
	input s0,s1;
	output y;
	
	assign y = (!s1)&(!s0)&a |
					(!s1)&(s0)&b |
					(s1)&(!s0)&c |
					(s1)&(s0)&d;
endmodule

		
	
	
	
	