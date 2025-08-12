module seq1_gen_tb();
	reg clk,rst;
	wire qout;
	
	seq1_gen seq1(clk,rst,qout);
	
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
		$monitor("rst=%b,q=%b",rst,qout);
		
	initial
		begin
			$dumpfile("dump.vcd");
			$dumpvars;
		end
		
endmodule