`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:12:17 04/11/2025
// Design Name:   one_bit_comp
// Module Name:   /home/sahithi-shetty/Desktop/github_related/one_bit_comparator/one_bit_comp_tb.v
// Project Name:  one_bit_comparator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: one_bit_comp
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module one_bit_comp_tb;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire lt;
	wire gt;
	wire eq;

	// Instantiate the Unit Under Test (UUT)
	one_bit_comp uut (
		.a(a), 
		.b(b), 
		.lt(lt), 
		.gt(gt), 
		.eq(eq)
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
      
endmodule

