`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:50:16 05/13/2025
// Design Name:   ha_using_1x4_demux
// Module Name:   /home/sahithi-shetty/Desktop/github_related/half_adder_using_demux/ha_using_demux_tb.v
// Project Name:  half_adder_using_demux
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ha_using_1x4_demux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ha_using_demux_tb;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire sum;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	ha_using_1x4_demux uut (
		.a(a), 
		.b(b), 
		.sum(sum), 
		.carry(carry)
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
	
	initial
		$monitor("a=%b,b=%b,sum=%b,carry=%b",a,b,sum,carry);
      
endmodule

