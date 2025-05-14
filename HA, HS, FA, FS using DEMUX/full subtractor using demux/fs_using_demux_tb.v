`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:21:18 05/13/2025
// Design Name:   fs_using_1x8demux
// Module Name:   /home/sahithi-shetty/Desktop/github_related/full_subtractor_using_demux/fs_using_demux_tb.v
// Project Name:  full_subtractor_using_demux
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fs_using_1x8demux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fs_using_demux_tb;

	// Inputs
	reg a;
	reg b;
	reg bin;

	// Outputs
	wire diff;
	wire borrow;

	// Instantiate the Unit Under Test (UUT)
	fs_using_1x8demux uut (
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
	
	initial
		$monitor("a=%b,b=%b,bin=%b,diff=%b,borrow=%b",a,b,bin,diff,borrow);
      
endmodule

