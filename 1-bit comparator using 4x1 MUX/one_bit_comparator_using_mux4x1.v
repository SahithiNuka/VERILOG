`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:33:41 05/12/2025 
// Design Name: 
// Module Name:    one_bit_comparator_using_mux4x1 
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
module one_bit_comparator_using_mux4x1(a,b,lt,gt,eq);
   input a,b;
   output lt,gt,eq;

	mux4x1 m1(1'b0,1'b1,1'b0,1'b0,a,b,lt);
	mux4x1 m2(1'b0,1'b0,1'b1,1'b0,a,b,gt);
	mux4x1 m3(1'b1,1'b0,1'b0,1'b1,a,b,eq);
	
endmodule

module mux4x1(a,b,c,d,s1,s0,y);
	input a,b,c,d,s1,s0;
	output reg y;
	
	always@(*)
		begin
			case({s1,s0})
				0: y = a;
				1: y = b;
				2: y = c;
				3: y = d;
			endcase
		end
endmodule
