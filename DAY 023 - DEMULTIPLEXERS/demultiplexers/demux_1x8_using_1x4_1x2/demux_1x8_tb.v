`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:03:08 05/08/2025
// Design Name:   demux_1x8
// Module Name:   /home/sahithi-shetty/Desktop/github_related/demux_1x8_using_1x2_1x4/demux_1x8_tb.v
// Project Name:  demux_1x8_using_1x2_1x4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: demux_1x8
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module demux_1x8_tb;

	// Inputs
	reg i;
	reg s0;
	reg s1;
	reg s2;

	// Outputs
	wire [7:0] y;

	// Instantiate the Unit Under Test (UUT)
	demux_1x8 uut (
		.i(i), 
		.s0(s0), 
		.s1(s1), 
		.s2(s2), 
		.y(y)
	);

	initial begin
		// Initialize Inputs
		i = 1;
		s0 = 0;
		s1 = 0;
		s2 = 0;
		#10;
		
		i = 1;
		s0 = 1;
		s1 = 0;
		s2 = 0;
		#10;
		
		i = 1;
		s0 = 0;
		s1 = 1;
		s2 = 0;
		#10;
		
		i = 1;
		s0 = 1;
		s1 = 1;
		s2 = 0;
		#10;
		
		i = 1;
		s0 = 0;
		s1 = 0;
		s2 = 1;
		#10;

		i = 1;
		s0 = 1;
		s1 = 0;
		s2 = 1;
		#10;
		
		i = 1;
		s0 = 0;
		s1 = 1;
		s2 = 1;
		#10;
		
		i = 1;
		s0 = 1;
		s1 = 1;
		s2 = 1;
		#10;
		$finish;
	end
      
	initial
		$monitor("i=%b,s2=%b,s1=%b,s0=%b,y=%b",i,s2,s1,s0,y);
endmodule

