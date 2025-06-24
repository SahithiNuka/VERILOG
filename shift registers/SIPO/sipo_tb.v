`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:29:08 05/13/2025
// Design Name:   sipo
// Module Name:   /home/sahithi-shetty/Desktop/github_related/sequential_ckts/sipo_register/sipo_tb.v
// Project Name:  sipo_register
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sipo
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sipo_tb;

	// Inputs
	reg sin;
	reg clk;
	reg rst;

	// Outputs
	wire [3:0] pout;

	// Instantiate the Unit Under Test (UUT)
	sipo uut (
		.sin(sin), 
		.clk(clk), 
		.rst(rst), 
		.pout(pout)
	);

	always #5 clk=!clk;
	initial
		clk = 1'b0;
		
	initial
		begin
			rst = 1'b1;
			#10;
			rst = 1'b0;
			sin = 1'b1;
			#10;
			sin = 1'b0;
			#10;
			sin = 1'b1;
			#10;
			sin = 1'b0;
			#10;
			#100;
			$finish;
			
	end
	
	initial
		$monitor("time=%t,sin=%b,pout=%b",$time,sin,pout);

	end
      
endmodule

