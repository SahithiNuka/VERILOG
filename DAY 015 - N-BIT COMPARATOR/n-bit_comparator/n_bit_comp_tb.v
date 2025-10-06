`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:19:30 04/12/2025
// Design Name:   n_bit_comp
// Module Name:   /home/sahithi-shetty/Desktop/github_related/n_bit_comparator/n_bit_comp_tb.v
// Project Name:  n_bit_comparator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: n_bit_comp
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module n_bit_comp_tb #(parameter N=8);

	// Inputs
	reg [N-1:0] a;
	reg [N-1:0] b;

	// Outputs
	wire lt;
	wire gt;
	wire eq;

	// Instantiate the Unit Under Test (UUT)
	n_bit_comp uut (
		.a(a), 
		.b(b), 
		.lt(lt), 
		.gt(gt), 
		.eq(eq)
	);
	
	integer i;

	initial begin
		for(i=0; i<8; i=i+1)
			begin
				a=$random();
				b=$random();
				#10;
			end
			$finish;
		end
      
endmodule

