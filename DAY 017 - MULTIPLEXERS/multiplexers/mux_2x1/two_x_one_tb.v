`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:19:11 04/18/2025
// Design Name:   two_x_one_mux
// Module Name:   /home/sahithi-shetty/Desktop/github_related/two_x_one_mux/two_x_one_tb.v
// Project Name:  two_x_one_mux
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: two_x_one_mux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module two_x_one_tb;

	// Inputs
	reg a;
	reg b;
	reg s;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	two_x_one_mux uut (
		.a(a), 
		.b(b), 
		.s(s), 
		.y(y)
	);

	initial begin
		a = 0;
		b = 0;
		s = 0;
		#10;
     
		a = 0;
		b = 1;
		s = 0;
		#10;
     
		a = 1;
		b = 0;
		s = 0;
		#10;
     
		a = 1;
		b = 1;
		s = 0;
		#10;
		
		a = 0;
		b = 0;
		s = 1;
		#10;
     
		a = 0;
		b = 1;
		s = 1;
		#10;
     
		a = 1;
		b = 0;
		s = 1;
		#10;
     
		a = 1;
		b = 1;
		s = 1;
		#10;
     
	  $finish;
	end
      
endmodule

