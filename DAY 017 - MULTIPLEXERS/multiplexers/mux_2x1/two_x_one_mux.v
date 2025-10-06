`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:17:26 04/18/2025 
// Design Name: 
// Module Name:    two_x_one_mux 
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

//dataflow modelling
module two_x_one_mux(a,b,s,y);
    input a,b;
    input s;
    output y;
	
	assign y = (!s&a) | (s&b);
endmodule


//gate-level modelling
module two_x_one_mux(a,b,s,y);
	input a,b;
	input s;
	output y;
	
	wire w1,w2,w3;
	
	not n1(w1,s);
	and a1(w2,w1,a);
	and a2(w3,s,b);
	or o1(y,w2,w3);
endmodule

//behavioral modelling
module two_x_one_mux(a,b,s,y);
	input a,b;
	input s;
	output y;
	
	always@(*)
		begin
			case(s)
				1'b0: y = a;
				1'b1: y = b;
			endcase
		end
endmodule