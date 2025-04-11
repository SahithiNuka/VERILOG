`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:10:06 04/11/2025 
// Design Name: 
// Module Name:    one_bit_comp 
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
module one_bit_comp(a,b,lt,gt,eq);
    input a,b;
    output lt,gt,eq;
	
	wire w1,w2;
	not n1(w1,a);
	not n2(w2,b);
	
	xnor x1(eq,a,b); //when a and b are equal
	and a1(lt,w1,b); //when a is less than b
	and a2(gt,a,w2); //when a is greater than b

endmodule
