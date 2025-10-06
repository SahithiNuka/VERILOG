`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:42:16 05/13/2025
// Design Name:   encoder_16_4
// Module Name:   /home/sahithi-shetty/Desktop/github_related/encoder_16_4/encoder_16_4_tb.v
// Project Name:  encoder_16_4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: encoder_16_4
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module encoder_16_4_tb;

	// Inputs
	reg [15:0] i;

	// Outputs
	wire [3:0] y;

	// Instantiate the Unit Under Test (UUT)
	encoder_16_4 uut (
		.i(i), 
		.y(y)
	);
	
	integer j;

	initial begin
		for(j=0; j<16; j=j+1)
			begin
				i = 2**j;
				#10;
			end
		$finish;

	end
	
	initial
		$monitor("i=%d,y=%b",i,y);
      
endmodule

