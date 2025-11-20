module clock_divider_tb;

	reg clk, rst;
	wire divby2, divby4, divby8, divby16;

	clock_divider dut(clk, rst, divby2, divby4, divby8, divby16);

	initial
		begin
			clk = 1'b0;
			forever #5 clk = !clk;
		end
	initial 
		begin
			rst = 0;
			#10;
			rst = 1;
			#100;
			$finish;
		end
		
	initial
		begin
			$dumpfile("dump.vcd");
			$dumpvars;
		end

endmodule

