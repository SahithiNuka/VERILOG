`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:35:37 04/11/2025
// Design Name:   four_bit_comp
// Module Name:   /home/sahithi-shetty/Desktop/github_related/four_bit_comparator/four_bit_comp_tb.v
// Project Name:  four_bit_comparator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: four_bit_comp
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module four_bit_comp_tb;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;

	// Outputs
	wire gt;
	wire lt;
	wire eq;
	
	integer i,j;

	// Instantiate the Unit Under Test (UUT)
	four_bit_comp uut (
		.a(a), 
		.b(b), 
		.gt(gt), 
		.lt(lt), 
		.eq(eq)
	);

	initial begin
		a = 4'b1010;
		b = 4'b1010;
		#10;
		
		a = 4'b0010;
		b = 4'b1010;
		#10;
		
		a = 4'b1110;
		b = 4'b1010;
		#10;
		$finish;
	end
	
	/*initial begin
		for(i=0; i<16; i=i+1)
			begin
				a=i;
				for(j=0; j<16; j=j+1)
					begin
						b=j;
						#10;
					end
			end
			$finish;
	end
	*/
endmodule

