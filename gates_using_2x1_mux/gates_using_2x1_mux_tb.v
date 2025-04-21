`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:58:45 04/21/2025
// Design Name:   gates_using_2x1_mux
// Module Name:   /home/sahithi-shetty/Desktop/github_related/gates_using_2x1_mux/gates_using_2x1_mux_tb.v
// Project Name:  gates_using_2x1_mux
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: gates_using_2x1_mux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module gates_using_2x1_mux_tb;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire y1;
	wire y2;
	wire y3;
	wire y4;
	wire y5;
	wire y6;
	wire y7;

	// Instantiate the Unit Under Test (UUT)
	gates_using_2x1_mux uut (
		.a(a), 
		.b(b), 
		.y1(y1), 
		.y2(y2), 
		.y3(y3), 
		.y4(y4), 
		.y5(y5), 
		.y6(y6), 
		.y7(y7)
	);

	initial begin
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

