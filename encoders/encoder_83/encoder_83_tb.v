`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:32:35 05/13/2025
// Design Name:   encoder_83
// Module Name:   /home/sahithi-shetty/Desktop/github_related/encoder_83/encoder_83_tb.v
// Project Name:  encoder_83
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: encoder_83
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module encoder_83_tb;

	// Inputs
	reg [7:0] i;

	// Outputs
	wire [2:0] y;

	// Instantiate the Unit Under Test (UUT)
	encoder_83 uut (
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
		i = 16;
		#10;
		i = 32;
		#10;
		i = 64;
		#10;
		i = 128;
		#10;
		i = 100;
		#10;
		$finish;
	end
	
	initial 
		$monitor("i=%b,y=%b",i,y);
      
endmodule

