`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:38:46 05/12/2025
// Design Name:   one_bit_comparator_using_mux4x1
// Module Name:   /home/sahithi-shetty/Desktop/github_related/one_bit_comparator_using_mux4x1/one_bit_comp_tb.v
// Project Name:  one_bit_comparator_using_mux4x1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: one_bit_comparator_using_mux4x1
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
	one_bit_comparator_using_mux4x1 uut (
		.a(a), 
		.b(b), 
		.lt(lt), 
		.gt(gt), 
		.eq(eq)
	);

	initial begin
		a = 1'b0;
		b = 1'b0;
		#10;
		
		a = 1'b0;
		b = 1'b1;
		#10;
		
		a = 1'b1;
		b = 1'b0;
		#10;
		
		a = 1'b1;
		b = 1'b1;
		#10;
		$finish;
	end
	
	initial
		$monitor("a=%b,b=%b,lt=%b,gt=%b,eq=%b",a,b,lt,gt,eq);
      
endmodule

