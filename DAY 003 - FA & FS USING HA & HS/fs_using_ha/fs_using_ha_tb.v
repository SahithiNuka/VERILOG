`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:39:45 03/30/2025
// Design Name:   fs_using_ha
// Module Name:   /home/sahithi-shetty/Desktop/github_related/fs_using_ha/fs_using_hs_tb.v
// Project Name:  fs_using_ha
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fs_using_ha
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fs_using_hs_tb;

	// Inputs
	reg a;
	reg b;
	reg c;

	// Outputs
	wire diff;
	wire borrow;
	
	integer i;

	// Instantiate the Unit Under Test (UUT)
	fs_using_ha uut (
		.a(a), 
		.b(b), 
		.c(c), 
		.diff(diff), 
		.borrow(borrow)
	);

	initial begin
		for(i=0; i<8; i=i+1)
			begin
				{a,b,c} = i;
				#10;
			end
			$finish;
       
	end
      
endmodule

