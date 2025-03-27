`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:00:04 03/27/2025
// Design Name:   four_x_three_multiplier
// Module Name:   /home/sahithi-shetty/Desktop/github_related/four_x_three_multiplier/four_x_three_multiplier_tb.v
// Project Name:  four_x_three_multiplier
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: four_x_three_multiplier
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module four_x_three_multiplier_tb;

	// Inputs
	reg [3:0] a;
	reg [2:0] b;

	// Outputs
	wire [6:0] p;

	// Instantiate the Unit Under Test (UUT)
	four_x_three_multiplier uut (
		.a(a), 
		.b(b), 
		.p(p)
	);

	initial begin
		a=4'b0011;
		b=3'b101;
		#10;
		
		a=4'b1100;
		b=3'b011;
		#10;
		
		a=4'b1001;
		b=3'b100;
		#10;
		
		a=4'b1000;
		b=3'b101;
		#10;
		
		$finish;
	end
      
endmodule

