`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:53:29 05/16/2025
// Design Name:   pencoder_42
// Module Name:   /home/sahithi-shetty/Desktop/github_related/pencoder_42/pencoder_42_tb.v
// Project Name:  pencoder_42
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pencoder_42
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pencoder_42_tb;

	// Inputs
	reg [3:0] i;

	// Outputs
	wire [1:0] y;

	// Instantiate the Unit Under Test (UUT)
	pencoder_42 uut (
		.i(i), 
		.y(y)
	);

	initial begin
		i = 1;
		#10;
		
		i = 2;
		#10;
		
		i = 4;
		#10;
		
		i = 8;
		#10;
		
		i = 3;
		#10;
		
		i = 7;
		#10;
		
		i = 14;
		#10;
		$finish;

	end
	
	initial
		$monitor("i=%b,y=%b",i,y);
      
endmodule

