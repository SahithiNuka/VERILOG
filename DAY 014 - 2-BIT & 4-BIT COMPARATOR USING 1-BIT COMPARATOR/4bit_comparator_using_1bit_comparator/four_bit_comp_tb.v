`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:59:04 04/11/2025
// Design Name:   four_bit_using_one_bit_comp
// Module Name:   /home/sahithi-shetty/Desktop/github_related/four_bit_copm_using_one_bit_comp/four_bit_comp_tb.v
// Project Name:  four_bit_copm_using_one_bit_comp
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: four_bit_using_one_bit_comp
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
	wire lt;
	wire eq;
	wire gt;
	
	integer i,j;

	// Instantiate the Unit Under Test (UUT)
	four_bit_using_one_bit_comp uut (
		.a(a), 
		.b(b), 
		.lt(lt), 
		.eq(eq), 
		.gt(gt)
	);

/*	initial begin
		a = 4'b1011;
		b = 4'b1011;
		#10;
		
		a = 4'b0011;
		b = 4'b1000;
		#10;
		
		a = 4'b0101;
		b = 4'b0001;
		#10;
		
		$finish;
	end
	*/
	initial
		begin
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
endmodule

