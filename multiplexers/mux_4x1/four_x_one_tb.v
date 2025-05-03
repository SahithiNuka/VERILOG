`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:47:56 04/18/2025
// Design Name:   four_x_one_mux
// Module Name:   /home/sahithi-shetty/Desktop/github_related/four_x_one_mux/four_x_one_tb.v
// Project Name:  four_x_one_mux
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: four_x_one_mux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module four_x_one_tb;

	// Inputs
	reg [3:0] i;
	reg [1:0] s;

	// Outputs
	wire y;
	
	integer j,k;

	// Instantiate the Unit Under Test (UUT)
	four_x_one_mux uut (
		.i(i), 
		.s(s), 
		.y(y)
	);

	initial begin
		for(j=0; j<4; j=j+1)
			begin
				{s[1],s[0]} = j;
				for(k=0; k<16; k=k+1)
					begin
						{i[3],i[2],i[1],i[0]} = k;
						#10;
					end
			end
			$finish;
	end
      
endmodule

