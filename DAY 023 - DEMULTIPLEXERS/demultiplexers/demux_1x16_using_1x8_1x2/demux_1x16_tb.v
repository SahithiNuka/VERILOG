`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:54:25 05/09/2025
// Design Name:   demux_1x16_using_1x8_1x2
// Module Name:   /home/sahithi-shetty/Desktop/github_related/demux_1x16_using_1x8_1x2/demux_1x16_tb.v
// Project Name:  demux_1x16_using_1x8_1x2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: demux_1x16_using_1x8_1x2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module demux_1x16_tb;

	// Inputs
	reg i;
	reg s3;
	reg s2;
	reg s1;
	reg s0;

	// Outputs
	wire [15:0] y;

	// Instantiate the Unit Under Test (UUT)
	demux_1x16_using_1x8_1x2 uut (
		.i(i), 
		.s3(s3), 
		.s2(s2), 
		.s1(s1), 
		.s0(s0), 
		.y(y)
	);

	initial begin
		i = 1;
		s3 = 0;
		s2 = 0;
		s1 = 0;
		s0 = 0;
		#10;
		
		i = 1;
		s3 = 0;
		s2 = 0;
		s1 = 0;
		s0 = 1;
		#10;
		
		i = 1;
		s3 = 0;
		s2 = 0;
		s1 = 1;
		s0 = 0;
		#10;
		
		i = 1;
		s3 = 0;
		s2 = 0;
		s1 = 1;
		s0 = 1;
		#10;
		
		i = 1;
		s3 = 0;
		s2 = 1;
		s1 = 0;
		s0 = 0;
		#10;
		
		i = 1;
		s3 = 0;
		s2 = 1;
		s1 = 0;
		s0 = 1;
		#10;
		
		i = 1;
		s3 = 0;
		s2 = 1;
		s1 = 1;
		s0 = 0;
		#10;
		
		i = 1;
		s3 = 0;
		s2 = 1;
		s1 = 1;
		s0 = 1;
		#10;
		
		i = 1;
		s3 = 1;
		s2 = 0;
		s1 = 0;
		s0 = 0;
		#10;
		
		i = 1;
		s3 = 1;
		s2 = 0;
		s1 = 0;
		s0 = 1;
		#10;
		
		i = 1;
		s3 = 1;
		s2 = 0;
		s1 = 1;
		s0 = 0;
		#10;

		i = 1;
		s3 = 1;
		s2 = 0;
		s1 = 1;
		s0 = 1;
		#10;
		
		i = 1;
		s3 = 1;
		s2 = 1;
		s1 = 0;
		s0 = 0;
		#10;
		
		i = 1;
		s3 = 1;
		s2 = 1;
		s1 = 0;
		s0 = 1;
		#10;
		
		i = 1;
		s3 = 1;
		s2 = 1;
		s1 = 1;
		s0 = 0;
		#10;
        
		i = 1;
		s3 = 1;
		s2 = 1;
		s1 = 1;
		s0 = 1;
		#10;
		$finish;
	end
	
	initial
		$monitor("i=%b,s3=%b,s2=%b,s1=%b,s0=%b,y=%b",i,s3,s2,s1,s0,y);
      
endmodule

