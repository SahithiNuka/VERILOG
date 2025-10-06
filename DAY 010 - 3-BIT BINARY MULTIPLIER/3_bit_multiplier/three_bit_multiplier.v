`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:28:53 03/27/2025 
// Design Name: 
// Module Name:    three_bit_multiplier 
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
module three_bit_multiplier(a,b,p);
    input [2:0] a,b;
    output [5:0] p;

	wire [15:1]x;
	
	assign p[0] = a[0] & b[0];
	
	assign x[1] = a[1] & b[0];
	assign x[2] = a[2] & b[0];
	
	assign x[3] = a[0] & b[1];
	assign x[4] = a[1] & b[1];
	assign x[5] = a[2] & b[1];
	ha h1(x[3],x[1],p[1],x[6]);
	
	fa f1(x[4],x[2],x[6],x[7],x[8]);
	
	ha h2(x[5],x[8],x[9],x[10]);
	
	assign x[11] = a[0]&b[2];
	assign x[12] = a[1]&b[2];
	assign x[13] = a[2]&b[2];
	
	ha h3(x[7],x[11],p[2],x[14]);
	
	fa f2(x[9],x[12],x[14],p[3],x[15]);
	
	fa f3(x[13],x[10],x[15],p[4],p[5]);

endmodule


module ha(a,b,s,c);
	input a,b;
	output s,c;
	
	assign s=a^b;
	assign c=a&b;
endmodule

module fa(a,b,c,s,cout);
	input a,b,c;
	output s,cout;
	
	assign s = a^b^c;
	assign cout = (a&b) | (b&c) | (a&c);
endmodule
