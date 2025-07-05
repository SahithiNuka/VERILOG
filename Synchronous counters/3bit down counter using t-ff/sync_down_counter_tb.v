module sync_down_counter_tb();
	reg clk,rst;
	wire [2:0]q;
	
	sync_down_counter down(clk,rst,q);
	
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
			#80;
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