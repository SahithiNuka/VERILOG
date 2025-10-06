module mod6_counter_tb();
	reg clk,rst;
	wire [2:0]q;
	
	mod6_counter mod6(clk,rst,q);
	
	initial
		begin
			clk = 1'b0;
			forever #5 clk = ~clk;
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
		$monitor("rst=%b,q=%b",rst,q);
		
	initial
		begin
			$dumpfile("dump.vcd");
			$dumpvars;
		end
		
endmodule