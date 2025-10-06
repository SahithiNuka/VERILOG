`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:41:41 03/27/2025
// Design Name:   three_bit_multiplier
// Module Name:   /home/sahithi-shetty/Desktop/github_related/three_bit_multiplier/three_bit_multiplier_tb.v
// Project Name:  three_bit_multiplier
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: three_bit_multiplier
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module three_bit_multiplier_tb;

	// Inputs
	reg [2:0] a;
	reg [2:0] b;

	// Outputs
	wire [5:0] p;

	// Instantiate the Unit Under Test (UUT)
	three_bit_multiplier uut (
		.a(a), 
		.b(b), 
		.p(p)
	);

	initial begin
		a = 3'b010;
		b = 3'b110;
		#10;
		
		a = 3'b100;
		b = 3'b111;
		#10;
		
		a = 3'b011;
		b = 3'b011;
		#10;
		
		a = 3'b101;
		b = 3'b101;
		#10;
		
		$finish;

	end
      
endmodule

