`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:22:09 04/19/2025
// Design Name:   mux_16x1_using_8x1_2x1
// Module Name:   /home/sahithi-shetty/Desktop/github_related/mux_16x1_using_8x1_2x1/mux_16x1_using_8x1_2x1_tb.v
// Project Name:  mux_16x1_using_8x1_2x1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux_16x1_using_8x1_2x1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux_16x1_using_8x1_2x1_tb;

	// Inputs
	reg [15:0] i;
	reg s0;
	reg s1;
	reg s2;
	reg s3;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	mux_16x1_using_8x1_2x1 uut (
		.i(i), 
		.s0(s0), 
		.s1(s1), 
		.s2(s2), 
		.s3(s3), 
		.y(y)
	);

	initial begin
		i = 16'b0010_0101_1110_0111;
		s0 = 0;
		s1 = 0;
		s2 = 0;
		s3 = 0;
		#10;
		
		i = 16'b0010_0101_1110_0111;
		s0 = 0;
		s1 = 1;
		s2 = 0;
		s3 = 0;
		#10;
      
      i = 16'b0010_0101_1110_0111;
		s0 = 0;
		s1 = 0;
		s2 = 1;
		s3 = 1;
		#10;
      
		i = 16'b0010_0101_1110_0111;
		s0 = 0;
		s1 = 0;
		s2 = 1;
		s3 = 0;
		#10;
      
		i = 16'b0010_0101_1110_0111;
		s0 = 1;
		s1 = 1;
		s2 = 1;
		s3 = 0;
		#10;
      
		i = 16'b0010_0101_1110_0111;
		s0 = 1;
		s1 = 1;
		s2 = 1;
		s3 = 1;
		#10;
      
		$finish;
	end
	initial
		$monitor("i=%b,s3=%b,s2=%b,s1=%b,s0=%b,y=%b",i,s3,s2,s1,s0,y);
      
endmodule

