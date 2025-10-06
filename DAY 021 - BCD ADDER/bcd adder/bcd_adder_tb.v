`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:42:36 04/11/2025
// Design Name:   bcd_adder
// Module Name:   /home/sahithi-shetty/Desktop/github_related/bcd_adder/bcd_adder_tb.v
// Project Name:  bcd_adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bcd_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bcd_adder_tb;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg cin;

	// Outputs
	wire [7:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	bcd_adder uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.sum(sum), 
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		a = 4'b0011;
		b = 4'b0101;
		cin = 0;
		#10;
		
		a = 4'b0111;
		b = 4'b0100;
		cin = 0;
		#10;
		
		a = 4'b0100;
		b = 4'b0011;
		cin = 1;
		#10;
		
		a = 4'b0100;
		b = 4'b0001;
		cin = 0;
		#10;
		
		a = 4'b1100;
		b = 4'b0001;
		cin = 1;
		#10;
		
		a = 4'b0100;
		b = 4'b0111;
		cin = 1;
		#10;
		$finish;

	end
      
endmodule

