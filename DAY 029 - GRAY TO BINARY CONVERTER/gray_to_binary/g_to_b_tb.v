`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:17:18 03/27/2025
// Design Name:   g_to_b
// Module Name:   /home/sahithi-shetty/Desktop/github_related/gray_to_binary/g_to_b_tb.v
// Project Name:  gray_to_binary
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: g_to_b
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module g_to_b_tb;

	// Inputs
	reg [3:0] g;

	// Outputs
	wire [3:0] b;
	
	integer i;

	// Instantiate the Unit Under Test (UUT)
	g_to_b uut (
		.g(g), 
		.b(b)
	);

	initial begin
		for(i=0; i<16; i=i+1)
			begin
				g=i;
				#10;
			end
			$finish;
	end
      
endmodule

