`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:55:07 03/30/2025
// Design Name:   carry_savve_adder
// Module Name:   /home/sahithi-shetty/Desktop/github_related/carry_save_adder/carry_save_adder_tb.v
// Project Name:  carry_save_adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: carry_savve_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module carry_save_adder_tb;

	// Inputs
	reg [3:0] x;
	reg [3:0] y;
	reg [3:0] z;

	// Outputs
	wire [4:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	carry_savve_adder uut (
		.x(x), 
		.y(y), 
		.z(z), 
		.sum(sum), 
		.cout(cout)
	);

	initial begin
		x = 4'b1011;
		y = 4'b0010;
		z = 4'b1111;
		#10;
		
		x = 4'b0111;
		y = 4'b1100;
		z = 4'b0110;
		#10;
		
		x = 4'b0101;
		y = 4'b1111;
		z = 4'b1110;
		#10;
		
		x = 4'b0011;
		y = 4'b1101;
		z = 4'b1010;
		#10;
		$finish;
	end
      
endmodule

