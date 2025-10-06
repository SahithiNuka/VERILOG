`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:04:18 05/16/2025
// Design Name:   pencoder_83
// Module Name:   /home/sahithi-shetty/Desktop/github_related/pencoder_83/pencoder_83_tb.v
// Project Name:  pencoder_83
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pencoder_83
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pencoder_83_tb;

	// Inputs
	reg [7:0] i;

	// Outputs
	wire [2:0] y;

	// Instantiate the Unit Under Test (UUT)
	pencoder_83 uut (
		.i(i), 
		.y(y)
	);

	initial begin
		i= 8'h80;
		#10;
		i = 8'h40;
		#10;
		i = 8'h20;
		#10;
		i = 8'h10;
		#10;
		i = 8'h08;
		#10;
		i = 8'h04;
		#10;
		i = 8'h02;
		#10;
		i = 8'h01;
		#10;
		i = 8'h156;
		#10;
		i = 8'h200;
		#10;
		$finish;
	end
     
	initial 
		$monitor("i=%b,y=%b",i,y);
endmodule

