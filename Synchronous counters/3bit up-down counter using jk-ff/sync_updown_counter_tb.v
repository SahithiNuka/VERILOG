module sync_updown_counter_tb();
	reg clk,rst,m;
	wire [2:0]q;
	
	sync_updown_counter updown(clk,rst,m,q);
	
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
			m = 1'b1;
			#100;
			m = 1'b0;
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