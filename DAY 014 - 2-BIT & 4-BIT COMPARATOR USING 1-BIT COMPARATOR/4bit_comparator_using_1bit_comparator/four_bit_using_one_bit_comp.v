`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:27:49 04/11/2025 
// Design Name: 
// Module Name:    four_bit_using_one_bit_comp 
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
module four_bit_using_one_bit_comp(a,b,lt,eq,gt);
    input [3:0] a,b;
    output lt,eq,gt;

	wire [18:1]w;
	
	one_bit_comp c1(a[3],b[3],w[1],w[2],w[3]);
	one_bit_comp c2(a[2],b[2],w[4],w[5],w[6]);
	one_bit_comp c3(a[1],b[1],w[7],w[8],w[9]);
	one_bit_comp c4(a[0],b[0],w[10],w[11],w[12]);
	
	and a1(w[13],w[4],w[2]);
	and a2(w[14],w[2],w[6]);
	and a3(w[15],w[2],w[7],w[5]);
	and a4(w[16],w[2],w[9],w[5]);
	and a5(w[17],w[2],w[10],w[5],w[8]);
	and a6(w[18],w[12],w[2],w[5],w[8]);
	
	assign lt = w[1] | w[13] | w[15] | w[17];
	assign gt = w[3] | w[14] | w[16] | w[18];
	assign eq = w[2] & w[5] & w[11] & w[8];
	

endmodule


module one_bit_comp(a,b,lt,eq,gt);
	input a,b;
	output lt,gt,eq;
	
	wire w1,w2;
	
	not n1(w1,a);
	not n2(w2,b);
	
	assign lt = (w1&b);
	assign gt = (a&w2);
	assign eq = a ^~ b;
	
endmodule
