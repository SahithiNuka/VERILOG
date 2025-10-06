`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:21:05 05/21/2025
// Design Name:   decoder_38
// Module Name:   /home/sahithi-shetty/Desktop/github_related/decoder_38/decoder_38_tb.v
// Project Name:  decoder_38
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: decoder_38
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module decoder_38_tb;

	// Inputs
	reg [2:0] s;

	// Outputs
	wire [7:0] d;
	
	integer j;

	// Instantiate the Unit Under Test (UUT)
	decoder_38 uut (
		.s(s), 
		.d(d)
	);

	initial begin
		for(j=0; j<8; j=j+1)
			begin
				s=j;
				#10;
			end
			$finish;
	end
	initial
		$monitor("s%b,d=%b",s,d);
      
endmodule

