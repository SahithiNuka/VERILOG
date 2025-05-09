`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:16:33 05/09/2025
// Design Name:   mux_Kx1
// Module Name:   /home/sahithi-shetty/Desktop/github_related/mux_kx1/mux_Kx1_tb.v
// Project Name:  mux_kx1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux_Kx1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux_Kx1_tb#(parameter K=64)();

	// Inputs
	reg [K-1:0] i;
	reg [5:0] s;

	// Outputs
	wire y;
	
	integer j;

	// Instantiate the Unit Under Test (UUT)
	mux_Kx1 uut (
		.i(i), 
		.s(s), 
		.y(y)
	);

	initial begin
			for(j=0; j<K; j=j+1)
				begin
					i = $random();
					s = $random();
					#10;
				end
			$finish;
		end
		initial
			$monitor("i=%b,s=%d,y=%d",i,s,y);
      
endmodule

