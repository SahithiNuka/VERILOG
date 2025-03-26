`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:32:33 03/26/2025
// Design Name:   ripple_carry_adder
// Module Name:   /home/sahithi-shetty/Desktop/github_related/ripple_carry_adder/rca_tb.v
// Project Name:  ripple_carry_adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ripple_carry_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module rca_tb;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg cin;

	// Outputs
	wire [3:0] sum;
	wire cout;
	
	integer i,j;

	// Instantiate the Unit Under Test (UUT)
	ripple_carry_adder uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.sum(sum), 
		.cout(cout)
	);

	/*initial begin
		a = 4'b1010;
		b = 4'b1101;
		cin = 0;
		#10;
		
		a = 4'b1100;
		b = 4'b0011;
		cin = 0;
		#10;
		$finish;*/
		
		initial
			begin
				cin = 0;
				for(i=0; i<16; i=i+1)
					begin
						a = i;
						for(j=0; j<16; j=j+1)
							begin
								b=j;
								#10;
							end
					end
			end
      
endmodule

