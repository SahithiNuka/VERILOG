`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:30:38 05/05/2025
// Design Name:   fa_using_mux
// Module Name:   /home/sahithi-shetty/Desktop/github_related/fulladder_using_mux/fa_tb.v
// Project Name:  fulladder_using_mux
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fa_using_mux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fa_tb;

	// Inputs
	reg a;
	reg b;
	reg cin;

	// Outputs
	wire sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	fa_using_mux uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.sum(sum), 
		.cout(cout)
	);

	initial begin
		a = 0;
		b = 0;
		cin = 0;
		#10;
		
		a = 0;
		b = 0;
		cin = 1;
		#10;
		
		a = 0;
		b = 1;
		cin = 0;
		#10;
		
		a = 0;
		b = 1;
		cin = 1;
		#10;
		
		a = 1;
		b = 0;
		cin = 0;
		#10;
		
		a = 1;
		b = 0;
		cin = 1;
		#10;
		
		a = 1;
		b = 1;
		cin = 0;
		#10;
		
		a = 1;
		b = 1;
		cin = 1;
		#10;
		
		$finish;
	end
      
endmodule

