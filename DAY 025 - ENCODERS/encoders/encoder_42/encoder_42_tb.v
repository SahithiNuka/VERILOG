`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:52:21 05/15/2025
// Design Name:   encoder_42
// Module Name:   /home/sahithi-shetty/Desktop/github_related/encoder_42/encoder_42_tb.v
// Project Name:  encoder_42
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: encoder_42
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module encoder_42_tb;

	// Inputs
	reg [3:0] i;

	// Outputs
	wire [1:0] y;

	// Instantiate the Unit Under Test (UUT)
	encoder_42 uut (
		.i(i), 
		.y(y)
	);

	initial begin
		i = 1;
		#10;
		
		i = 2;
		#10;
		
		i = 4;
		#10;
		
		i = 8;
		#10;
		
		i = 5;
		#10;
		$finish;

	end
   
	initial
		$monitor("i=%d,y=%b",i,y);
endmodule

