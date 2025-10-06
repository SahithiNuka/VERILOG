`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:37:53 05/13/2025
// Design Name:   pipo
// Module Name:   /home/sahithi-shetty/Desktop/github_related/sequential_ckts/pipo_register/pipo_tb.v
// Project Name:  pipo_register
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pipo
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pipo_tb;

	// Inputs
	reg [3:0] pin;
	reg clk;
	reg rst;

	// Outputs
	wire [3:0] pout;

	// Instantiate the Unit Under Test (UUT)
	pipo uut (
		.pin(pin), 
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
			pin = 4'b1010;
			#10;
			pin = 4'b1111;
			#10;
			pin = 4'b0111;
			#10;
			pin = 4'b0101;
			#10;
			pin = 4'b0011;
			#10;
			$finish;
			
	end
	
	initial
		$monitor("time=%t,pin=%b,pout=%b",$time,pin,pout);
      
endmodule

