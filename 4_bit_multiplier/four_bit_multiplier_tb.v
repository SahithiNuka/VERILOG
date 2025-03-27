`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:08:53 03/27/2025
// Design Name:   four_bit_multiplier
// Module Name:   /home/sahithi-shetty/Desktop/github_related/four_bit_multiplier/four_bit_multiplier_tb.v
// Project Name:  four_bit_multiplier
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: four_bit_multiplier
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module four_bit_multiplier_tb;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;

	// Outputs
	wire [7:0] p;

	// Instantiate the Unit Under Test (UUT)
	four_bit_multiplier uut (
		.a(a), 
		.b(b), 
		.p(p)
	);

	initial begin
		a=4'b0111;
		b=4'b0100;
		#10;
		
		a=4'b1010;
		b=4'b0011;
		#10;
		
		a=4'b0101;
		b=4'b1010;
		#10;
		
		a=4'b1100;
		b=4'b0100;
		#10;
		
		$finish;
	end
      
endmodule

