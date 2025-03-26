`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:58:07 03/24/2025
// Design Name:   fs
// Module Name:   /home/sahithi-shetty/Desktop/github_related/full_subtractor/fs_tb.v
// Project Name:  full_subtractor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fs
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
	fs uut (
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
        
		// Add stimulus here

	end
      
endmodule

