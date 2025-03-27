`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:05:45 03/27/2025
// Design Name:   two_bit_multiplier
// Module Name:   /home/sahithi-shetty/Desktop/github_related/two_bit_multiplier/two_bit_multiplier_tb.v
// Project Name:  two_bit_multiplier
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: two_bit_multiplier
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module two_bit_multiplier_tb;

	// Inputs
	reg [1:0] a;
	reg [1:0] b;

	// Outputs
	wire [3:0] p;

	// Instantiate the Unit Under Test (UUT)
	two_bit_multiplier uut (
		.a(a), 
		.b(b), 
		.p(p)
	);

	initial begin
		// Initialize Inputs
		a = 2'b11;
		b = 2'b01;
		#10;
		
		a = 2'b10;
		b = 2'b11;
		#10;
		
		$finish;

	end
      
endmodule

