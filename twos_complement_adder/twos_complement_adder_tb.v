`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:58:03 03/26/2025
// Design Name:   twos_complememt_adder
// Module Name:   /home/sahithi-shetty/Desktop/github_related/twos_complement_adder/twos_complement_adder_tb.v
// Project Name:  twos_complement_adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: twos_complememt_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module twos_complement_adder_tb;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg m;

	// Outputs
	wire [3:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	twos_complememt_adder uut (
		.a(a), 
		.b(b), 
		.m(m), 
		.sum(sum), 
		.cout(cout)
	);

	initial begin
		
		a = 4'b1010;
		b = 4'b1100;
		m = 0;
		#10;
		
		a = 4'b1000;
		b = 4'b0100;
		m = 0;
		#10;
		
		a = 4'b1010;
		b = 4'b0010;
		m = 0;
		#10;
		
		a = 4'b1111;
		b = 4'b1010;
		m = 1;
		#10;
		
		a = 4'b1010;
		b = 4'b0110;
		m = 1;
		#10;
		
		a = 4'b1001;
		b = 4'b0100;
		m = 1;
		#10;
		
		$finish;
		

	end
      
endmodule

