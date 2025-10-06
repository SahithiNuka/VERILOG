`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:32:30 05/09/2025
// Design Name:   carry_skip_adder
// Module Name:   /home/sahithi-shetty/Desktop/github_related/carry_skip_adder/carry_skip_adder_tb.v
// Project Name:  carry_skip_adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: carry_skip_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module carry_skip_adder_tb;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg c0;

	// Outputs
	wire [3:0] s;
	wire cout;
	
	integer i,j,k;

	// Instantiate the Unit Under Test (UUT)
	carry_skip_adder uut (
		.a(a), 
		.b(b), 
		.c0(c0), 
		.s(s), 
		.cout(cout)
	);

	/*initial begin
		for(k=0; k<2; k=k+1)
			begin
				c0=k;
				for(i=0; i<16; i=i+1)
					begin
						a=i;
						for(j=0; j<16; j=j+1)
							begin
								b=j;
								#10;
							end
					end
			end
			$finish;
	end*/
	initial
		begin
			a=1010;
			b=0111;
			c0=1;
			#10;
			
			a=1010;
			b=1111;
			c0=1;
			#10;
			
			a=1110;
			b=0111;
			c0=0;
			#10;
			
			a=1010;
			b=0001;
			c0=1;
			#10;
			$finish;
		end

	initial
		$monitor("a=%d,b=%d,c0=%b,s=%d,cout=%b",a,b,c0,s,cout);
      
endmodule

