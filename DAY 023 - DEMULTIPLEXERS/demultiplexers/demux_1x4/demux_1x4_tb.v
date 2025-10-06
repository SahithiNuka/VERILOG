`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:06:56 05/06/2025
// Design Name:   demux_1x4
// Module Name:   /home/sahithi-shetty/Desktop/github_related/demux_1x4/demux_1x4_tb.v
// Project Name:  demux_1x4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: demux_1x4
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module demux_1x4_tb;

	// Inputs
	reg i;
	reg s0;
	reg s1;

	// Outputs
	wire [3:0] y;
	

	// Instantiate the Unit Under Test (UUT)
	demux_1x4 uut (
		.i(i), 
		.s0(s0), 
		.s1(s1), 
		.y(y)
	);

	initial begin
		{s1,s0} = 2'b00;
		i = 0;
		#10;
		
		{s1,s0} = 2'b00;
		i = 1;
		#10;
		
		{s1,s0} = 2'b01;
		i = 0;
		#10;
		
		{s1,s0} = 2'b01;
		i = 1;
		#10;
		
		{s1,s0} = 2'b10;
		i = 0;
		#10;
		
		{s1,s0} = 2'b10;
		i = 1;
		#10;
      
		{s1,s0} = 2'b11;
		i = 0;
		#10;
		
		{s1,s0} = 2'b11;
		i = 1;
		#10;
		$finish;
	end
	initial
		$monitor("i=%b,s1=%b,s0=%b,y=%b",i,s1,s0,y);
endmodule

