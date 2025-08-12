module seq2_gen_tb();
	reg clk,rst;
	wire f;
	
	seq2_gen seq2(clk,rst,f);
	
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
		$monitor("rst=%b,f=%b",rst,f);
		
	initial
		begin
			$dumpfile("dump.vcd");
			$dumpvars;
		end
		
endmodule