`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:14:07 05/13/2025
// Design Name:   hs_using_1x4_demux
// Module Name:   /home/sahithi-shetty/Desktop/github_related/half_subtractor_using_demux/hs_using_demux_tb.v
// Project Name:  half_subtractor_using_demux
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: hs_using_1x4_demux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module hs_using_demux_tb;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire diff;
	wire borrow;

	// Instantiate the Unit Under Test (UUT)
	hs_using_1x4_demux uut (
		.a(a), 
		.b(b), 
		.diff(diff), 
		.borrow(borrow)
	);

	initial begin
		a = 0;
		b = 0;
		#10;
		
		a = 0;
		b = 1;
		#10;
		
		a = 1;
		b = 0;
		#10;
		
		a = 1;
		b = 1;
		#10;
		$finish;
	end
    
	initial
		$monitor("a=%b,b=%b,diff=%b,borrow=%b",a,b,diff,borrow);
		
endmodule

