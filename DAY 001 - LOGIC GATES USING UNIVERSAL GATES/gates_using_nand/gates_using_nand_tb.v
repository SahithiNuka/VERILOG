`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:18:22 03/23/2025
// Design Name:   gates_using_nand
// Module Name:   /home/sahithi-shetty/Desktop/github_related/gates_using_nand/gates_using_nand_tb.v
// Project Name:  gates_using_nand
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: gates_using_nand
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module gates_using_nand_tb;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	gates_using_nand uut (
		.a(a), 
		.b(b), 
		.y(y)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		#10;
        
		// Add stimulus here
		a = 0;
		b = 1;
		#10;
      
		a = 1;
		b = 0;
		#10;
        
		a = 1;
		b = 1;
		#10;
       		 
	end
	initial 
		begin
			$monitor("a=%b,b=%b,y=%b",a,b,y);
		end
		
      
endmodule

