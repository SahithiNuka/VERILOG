module up_counter_tb();
	reg clk,rst;
	wire [5:0]count;
	
	integer i;
	
	up_counter uc(clk,rst,count);
	
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
			for(i=0; i<64; i=i+1)
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