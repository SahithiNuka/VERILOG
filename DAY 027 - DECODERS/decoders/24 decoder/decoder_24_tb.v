`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:06:37 05/21/2025
// Design Name:   decoder_24
// Module Name:   /home/sahithi-shetty/Desktop/github_related/decoder_24/decoder_24_tb.v
// Project Name:  decoder_24
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: decoder_24
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module decoder_24_tb;

	// Inputs
	reg [1:0] y;

	// Outputs
	wire [3:0] i;

	// Instantiate the Unit Under Test (UUT)
	decoder_24 uut (
		.y(y), 
		.i(i)
	);

	initial begin
		y = 2'b00;
		#10;
		
		y = 2'b01;
		#10;
		
		y = 2'b10;
		#10;
		
		y = 2'b11;
		#10;
		$finish;

	end
   
	initial
		$monitor("y=%b,i=%b",y,i);
endmodule

