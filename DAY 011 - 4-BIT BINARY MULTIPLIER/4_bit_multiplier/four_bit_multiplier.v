`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:45:21 03/27/2025 
// Design Name: 
// Module Name:    four_bit_multiplier 
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
module four_bit_multiplier(a,b,p);
    input [3:0] a,b;
    output [7:0] p;

	wire [32:1]x;
	
	assign p[0] = a[0]&b[0];
	
	assign x[1] = a[1]&b[0];
	assign x[2] = a[2]&b[0];
	assign x[3] = a[3]&b[0];
	
	assign x[4] = a[0]&b[1];
	assign x[5] = a[1]&b[1];
	assign x[6] = a[2]&b[1];
	assign x[7] = a[3]&b[1];
	
	ha h1(x[4],x[1],p[1],x[8]);
	fa f1(x[5],x[2],x[8],x[9],x[10]);
	fa f2(x[6],x[3],x[10],x[11],x[12]);
	ha h2(x[7],x[12],x[13],x[14]);
	
	assign x[15] = a[0]&b[2];
	assign x[16] = a[1]&b[2];
	assign x[17] = a[2]&b[2];
	assign x[18] = a[3]&b[2];
	
	ha h3(x[9],x[15],p[2],x[19]);
	fa f3(x[16],x[11],x[19],x[20],x[21]);
	fa f4(x[13],x[17],x[21],x[22],x[23]);
	fa f5(x[14],x[18],x[23],x[24],x[25]);
	
	assign x[26] = a[0]&b[3];
	assign x[27] = a[1]&b[3];
	assign x[28] = a[2]&b[3];
	assign x[29] = a[3]&b[3];
	
	ha h4(x[26],x[20],p[3],x[30]);
	fa f6(x[27],x[22],x[30],p[4],x[31]);
	fa f7(x[28],x[24],x[31],p[5],x[32]);
	fa f8(x[25],x[29],x[32],p[6],p[7]);
	
endmodule


module ha(a,b,s,c);
	input a,b;
	output s,c;
	
	assign s=a^b;
	assign c=a&b;
endmodule

module fa(a,b,c,s,co);
	input a,b,c;
	output s,co;
	
	assign s=a^b^c;
	assign co = (a&b) | (b&c) | (a&c);
	
endmodule
