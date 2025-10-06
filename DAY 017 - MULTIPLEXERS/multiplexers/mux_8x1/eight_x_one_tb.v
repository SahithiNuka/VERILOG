`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:11:37 04/18/2025
// Design Name:   eight_x_one_mux
// Module Name:   /home/sahithi-shetty/Desktop/github_related/eight_x_one_mux/eight_x_one_tb.v
// Project Name:  eight_x_one_mux
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: eight_x_one_mux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module eight_x_one_tb;

	// Inputs
	reg [7:0] i;
	reg [2:0] s;

	// Outputs
	wire y;
	
	integer j,k;

	// Instantiate the Unit Under Test (UUT)
	eight_x_one_mux uut (
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
			s=110;
			#10;
			
			i=10110110;
			s=111;
			#10;
			$finish;
		end
		
	/*initial begin
		for(j=0; j<8; j=j+1)
			begin
				{s[2],s[1],s[0]} = j;
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

