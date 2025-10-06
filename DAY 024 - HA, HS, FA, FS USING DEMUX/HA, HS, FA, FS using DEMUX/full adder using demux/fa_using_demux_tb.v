`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:13:21 05/13/2025
// Design Name:   fa_using_1x8demux
// Module Name:   /home/sahithi-shetty/Desktop/github_related/full_adder_using_demux/fa_using_demux_tb.v
// Project Name:  full_adder_using_demux
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fa_using_1x8demux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fa_using_demux_tb;

	// Inputs
	reg a;
	reg b;
	reg cin;

	// Outputs
	wire sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	fa_using_1x8demux uut (
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
	
	initial
		$monitor("a=%b,b=%b,cin=%b,sum=%b,cout=%b",a,b,cin,sum,cout);
      
endmodule

