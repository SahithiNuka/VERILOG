`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:35:18 05/05/2025 
// Design Name: 
// Module Name:    fs_using_mux 
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
module fs_using_mux(a,b,bin,diff,borrow);
   input a,b,bin;
   output diff,borrow;

	wire w1;
	
	not n1(w1,bin);
	
	mux_4x1 m1(bin,w1,w1,bin,b,a,diff);
	mux_4x1 m2(bin,1'b1,1'b0,bin,b,a,borrow);
	
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