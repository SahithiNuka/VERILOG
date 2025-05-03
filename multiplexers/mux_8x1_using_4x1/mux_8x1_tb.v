`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:12:58 04/18/2025
// Design Name:   mux_8x1_using_4x1_2x1
// Module Name:   /home/sahithi-shetty/Desktop/github_related/mux_8x1_using_4x1_2x1/mux_8x1_tb.v
// Project Name:  mux_8x1_using_4x1_2x1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux_8x1_using_4x1_2x1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux_8x1_tb;

	// Inputs
	reg [7:0] i;
	reg s0;
	reg s1;
	reg s2;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	mux_8x1_using_4x1_2x1 uut (
		.i(i), 
		.s0(s0), 
		.s1(s1), 
		.s2(s2), 
		.y(y)
	);

	initial begin
		i = 10110111;
		s0 = 0;
		s1 = 0;
		s2 = 0;
		#10;
		
		i = 10110111;
		s0 = 1;
		s1 = 1;
		s2 = 0;
		#10;
		
		i = 10110111;
		s0 = 1;
		s1 = 0;
		s2 = 0;
		#10;
		
		i = 10110111;
		s0 = 0;
		s1 = 1;
		s2 = 1;
		#10;
		$finish;

	end
      
endmodule

