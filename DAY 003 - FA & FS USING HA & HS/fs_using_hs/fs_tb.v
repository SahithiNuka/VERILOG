`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:19:24 03/24/2025
// Design Name:   fs_using_hs
// Module Name:   /home/sahithi-shetty/Desktop/github_related/full_sub_using_half_sub/fs_tb.v
// Project Name:  full_sub_using_half_sub
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fs_using_hs
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fs_tb;

	// Inputs
	reg a;
	reg b;
	reg c;

	// Outputs
	wire diff;
	wire borrow;

	// Instantiate the Unit Under Test (UUT)
	fs_using_hs uut (
		.a(a), 
		.b(b), 
		.c(c), 
		.diff(diff), 
		.borrow(borrow)
	);

	initial begin
		a = 0;
		b = 0;
		c = 0;
		#10;
		
		a = 0;
		b = 0;
		c = 1;
		#10;
		
		a = 0;
		b = 1;
		c = 0;
		#10;
		
		a = 0;
		b = 1;
		c = 1;
		#10;
		
		a = 1;
		b = 0;
		c = 0;
		#10;
		
		a = 1;
		b = 0;
		c = 1;
		#10;
		
		a = 1;
		b = 1;
		c = 0;
		#10;
		
		a = 1;
		b = 1;
		c = 1;
		#10;
		$finish;

	end
      
endmodule

