`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:09:00 05/13/2025
// Design Name:   siso
// Module Name:   /home/sahithi-shetty/Desktop/github_related/sequential_ckts/siso_register/siso_tb.v
// Project Name:  siso_register
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: siso
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module siso_tb;

	// Inputs
	reg sin;
	reg clk;
	reg rst;

	// Outputs
	wire sout;

	// Instantiate the Unit Under Test (UUT)
	siso uut (
		.sin(sin), 
		.clk(clk), 
		.rst(rst), 
		.sout(sout)
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
		$monitor("time=%t,sin=%b,sout=%b",$time,sin,sout);
      
endmodule

