`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:53:43 05/13/2025 
// Design Name: 
// Module Name:    hs_using_1x4_demux 
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
module hs_using_1x4_demux(a,b,diff,borrow);
    input a,b;
    output diff,borrow;
	
	wire [3:0]y;
	
	demux_1x4 d1(1'b1,a,b,y[3:0]);
	
	or o1(diff,y[1],y[2]);
	assign borrow = y[1];

endmodule

module demux_1x4(input i,s1,s0,
					output reg [3:0]y);
					
	always@(*)
		begin
			case({s1,s0})
				0: y = {3'b0,i};
				1: y = {2'b0,i,1'b0};
				2: y = {1'b0,i,2'b0};
				3: y = {i,3'b0};
				default: y = 4'b0000;
			endcase
		end

endmodule
