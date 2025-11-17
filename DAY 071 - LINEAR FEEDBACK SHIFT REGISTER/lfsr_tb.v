module lfsr_tb();
	reg clk,rst;
	wire [3:0]op;
	
	lfsr l1(clk,rst,op);
	
	initial
		begin
			clk = 1'b0;
			forever #5 clk = !clk;
		end
	
	initial
		begin
			rst = 1'b1;
			#10;
			rst = 1'b0;
			#100;
			$finish;
		end
		
	initial
		$monitor("rst=%b,op=%b",rst,op);
	
endmodule