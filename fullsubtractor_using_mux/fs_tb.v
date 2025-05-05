`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:40:27 05/05/2025
// Design Name:   fs_using_mux
// Module Name:   /home/sahithi-shetty/Desktop/github_related/fullsubtractor_using_mux/fs_tb.v
// Project Name:  fullsubtractor_using_mux
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fs_using_mux
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
	reg bin;

	// Outputs
	wire diff;
	wire borrow;

	// Instantiate the Unit Under Test (UUT)
	fs_using_mux uut (
		.a(a), 
		.b(b), 
		.bin(bin), 
		.diff(diff), 
		.borrow(borrow)
	);

	initial begin
		a = 0;
		b = 0;
		bin = 0;
		#10;
		
		a = 0;
		b = 0;
		bin = 1;
		#10;
		
		a = 0;
		b = 1;
		bin = 0;
		#10;
		
		a = 0;
		b = 1;
		bin = 1;
		#10;
		
		a = 1;
		b = 0;
		bin = 0;
		#10;
		
      a = 1;
		b = 0;
		bin = 1;
		#10;
		
		a = 1;
		b = 1;
		bin = 0;
		#10;
		
		a = 1;
		b = 1;
		bin = 1;
		#10;
		$finish;
		
	end
     	
endmodule

