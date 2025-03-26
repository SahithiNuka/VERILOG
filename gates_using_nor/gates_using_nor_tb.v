`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:18:17 03/24/2025
// Design Name:   gates_using_nor
// Module Name:   /home/sahithi-shetty/Desktop/github_related/gates_using_nor/gates_using_nor_tb.v
// Project Name:  gates_using_nor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: gates_using_nor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module gates_using_nor_tb;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	gates_using_nor uut (
		.a(a), 
		.b(b), 
		.y(y)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		#10;
		
		a = 0;
		b = 1;
		#10;

		a = 1;
		b = 0;
		#10;
		
		a = 1;
		b = 1;
		#10;
		$finish;
	end
      
endmodule

