module down_counter_tb();
	reg clk,rst;
	wire [5:0]count;
	
	integer i;
	
	down_counter dc(clk,rst,count);
	
	initial
		begin
			clk = 1'b0;
			forever #5 clk = ~clk;
		end
		
	initial
		begin
			rst = 1'b1;
			#10;
			$display("rst=%b,count=%d",rst,count);
			for(i=63; i>0; i=i-1)
				begin
					rst = 1'b0;
					#10;
					$display("rst=%b,count=%d",rst,count);
				end
		#10;
		$finish;
		end
	
	initial
		begin
			$dumpfile("dump.vcd");
			$dumpvars;
		end
endmodule