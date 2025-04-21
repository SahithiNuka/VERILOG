`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:49:51 04/21/2025 
// Design Name: 
// Module Name:    gates_using_2x1_mux 
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
module gates_using_2x1_mux(
    input a,b,
    output y1,y2,y3,y4,y5,y6,y7
    );

	mux2x1 m1(1'b1,1'b0,a,y1); //NOT GATE
	mux2x1 m2(1'b0,b,a,y2); //AND GATE
	mux2x1 m3(b,1'b1,a,y3); //OR GATE
	mux2x1 m4(1'b1,!b,a,y4); //NAND GATE
	mux2x1 m5(!b,1'b0,a,y5); //NOR GATE
	mux2x1 m6(b,!b,a,y6); //EXOR GATE
	mux2x1 m7(!b,b,a,y7); //EXNOR GATE
 
endmodule


module mux2x1(a,b,s,y);
	input a,b;
	input s;
	output y;
	
	assign y = !s&a | s&b;
endmodule
