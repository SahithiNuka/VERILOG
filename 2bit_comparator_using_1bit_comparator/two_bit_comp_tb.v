`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:14:33 04/11/2025
// Design Name:   two_bit_using_one_bit_comp
// Module Name:   /home/sahithi-shetty/Desktop/github_related/two_bit_comp_using_one_bit_comp/two_bit_comp_tb.v
// Project Name:  two_bit_comp_using_one_bit_comp
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: two_bit_using_one_bit_comp
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module two_bit_comp_tb;

	// Inputs
	reg [1:0] a;
	reg [1:0] b;

	// Outputs
	wire gt;
	wire lt;
	wire eq;
	
	integer i,j;

	// Instantiate the Unit Under Test (UUT)
	two_bit_using_one_bit_comp uut (
		.a(a), 
		.b(b), 
		.gt(gt), 
		.lt(lt), 
		.eq(eq)
	);

	initial begin
		for(i=0; i<4; i=i+1)
			begin
				a=i;
				for(j=0; j<4; j=j+1)
					begin
						b=j;
						#10;
					end
			end
			$finish;
	end
      
endmodule

