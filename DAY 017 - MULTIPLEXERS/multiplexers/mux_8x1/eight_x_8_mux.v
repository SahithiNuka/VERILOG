`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:00:07 04/18/2025 
// Design Name: 
// Module Name:    eight_x_one_mux 
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
module eight_x_one_mux(i,s,y);
    input [7:0] i;
    input [2:0] s;
    output y;

	assign y = ((!s[2])&(!s[1])&(!s[0])&i[0]) |
					((!s[2])&(!s[1])&(s[0])&i[1]) |
					((!s[2])&(s[1])&(!s[0])&i[2]) |
					((!s[2])&(s[1])&(s[0])&i[3]) |
					((s[2])&(!s[1])&(!s[0])&i[4]) |
					((s[2])&(!s[1])&(s[0])&i[5]) |
					((s[2])&(s[1])&(!s[0])&i[6]) |
					((s[2])&(s[1])&(s[0])&i[7]);

endmodule
