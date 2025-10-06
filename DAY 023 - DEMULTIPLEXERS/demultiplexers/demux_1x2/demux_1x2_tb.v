`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:54:26 05/06/2025
// Design Name:   demux_1x2
// Module Name:   /home/sahithi-shetty/Desktop/github_related/demux_1x2/demux_1x2_tb.v
// Project Name:  demux_1x2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: demux_1x2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module demux_1x2_tb;

	// Inputs
	reg i;
	reg s;

	// Outputs
	wire y0;
	wire y1;

	// Instantiate the Unit Under Test (UUT)
	demux_1x2 uut (
		.i(i), 
		.s(s), 
		.y0(y0), 
		.y1(y1)
	);

	initial begin
		
		i = 0;
		s = 0;
		#10;
        
		i = 0;
		s = 1;
		#10;
		
		i = 1;
		s = 0;
		#10;
		
		i = 1;
		s = 1;
		#10;
		$finish;
	end
	
	initial
		begin
			$monitor("i=%b,s=%b,y0=%b,y1=%b",i,s,y0,y1);
		end
      
endmodule

