module ring_counter_tb();
	reg clk,rst;
	wire [3:0]q;
	
	ring_counter rc(clk,rst,q);
	
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