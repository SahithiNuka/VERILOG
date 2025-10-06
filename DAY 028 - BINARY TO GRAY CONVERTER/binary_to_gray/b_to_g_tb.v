`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:08:15 03/27/2025
// Design Name:   b_to_g
// Module Name:   /home/sahithi-shetty/Desktop/github_related/binary_to_gray/b_to_g_tb.v
// Project Name:  binary_to_gray
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: b_to_g
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module b_to_g_tb;

	// Inputs
	reg [3:0] b;

	// Outputs
	wire [3:0] g;
	
	integer i;

	// Instantiate the Unit Under Test (UUT)
	b_to_g uut (
		.b(b), 
		.g(g)
	);

	initial begin
		// Initialize Inputs
		for(i=0; i<16; i=i+1)
			begin
				b=i;
				#10;
			end
			$finish;
	end
      
endmodule

