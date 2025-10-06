`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:11:31 04/12/2025 
// Design Name: 
// Module Name:    n_bit_comp 
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
module n_bit_comp#(parameter N = 8)(a,b,lt,gt,eq);
    input [N-1:0]a,b;
    output reg lt,gt,eq;

	always@(*)
		begin
			if(a>b)
				begin
					lt=0;
					eq=0;
					gt=1;
				end
			else if(a<b)
				begin
					lt=1;
					eq=0;
					gt=0;
				end
			else
				begin
					lt=0;
					eq=1;
					gt=0;
				end
		end

endmodule
