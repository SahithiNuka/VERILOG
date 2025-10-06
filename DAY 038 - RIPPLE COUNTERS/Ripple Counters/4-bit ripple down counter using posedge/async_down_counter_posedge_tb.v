module async_down_counter_posedge_tb();
	reg clk,rst;
	wire [3:0]q;

	async_down_counter_posedge down(clk,rst,q);
	
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
			#200;
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