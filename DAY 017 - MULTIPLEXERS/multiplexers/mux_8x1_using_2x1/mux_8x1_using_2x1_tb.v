`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:00:14 04/18/2025
// Design Name:   mux_8x1_using_2x1
// Module Name:   /home/sahithi-shetty/Desktop/github_related/mux_8x1_using_2x1/mux_8x1_using_2x1_tb.v
// Project Name:  mux_8x1_using_2x1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux_8x1_using_2x1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux_8x1_using_2x1_tb;

	// Inputs
	reg [7:0] i;
	reg [2:0] s;

	// Outputs
	wire y;

	integer j,k;
	// Instantiate the Unit Under Test (UUT)
	mux_8x1_using_2x1 uut (
		.i(i), 
		.s(s), 
		.y(y)
	);

	initial
		begin
			i=10110110;
			s=101;
			#10;
			
			i=10110110;
			s=100;
			#10;
			
			i=10110110;
			s=001;
			#10;
			
			i=10110110;
			s=111;
			#10;
			
			i=10110110;
			s=110;
			#10;
			
			$finish;
		end
		
	/*initial begin
		for(j=0; j<8; j=j+1)
			begin
				s=j;
				for(k=0; k<256; k=k+1)
					begin
						i=k;
						#10;
					end
		end
		$finish;
	end
	*/
		
endmodule

