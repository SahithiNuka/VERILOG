`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:38:22 04/18/2025 
// Design Name: 
// Module Name:    mux_8x1_using_2x1 
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
module mux_8x1_using_2x1(
    input [7:0] i,
    input [2:0] s,
    output y
    );

	wire w1,w2,w3,w4,w5,w6;
	mux2x1 m1(i[0],i[1],s[0],w1);
	mux2x1 m2(i[2],i[3],s[0],w2);
	mux2x1 m3(i[4],i[5],s[0],w3);
	mux2x1 m4(i[6],i[7],s[0],w4);
	
	mux2x1 m5(w1,w2,s[1],w5);
	mux2x1 m6(w3,w4,s[1],w6);
	
	mux2x1 m7(w5,w6,s[2],y);

endmodule


module mux2x1(a,b,s,y);
	input a,b;
	input s;
	output y;
	
	assign y = !s&a | s&b;
endmodule
