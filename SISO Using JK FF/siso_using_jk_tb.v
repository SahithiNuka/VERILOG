module siso_using_jk_tb();
	reg clk,rst;
	reg sin;
	wire sout;
	
	siso_using_jk siso(clk,rst,sin,sout);
	
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
			sin = 1'b1;
			#10;
			sin = 1'b0;
			#10;
			sin = 1'b1;
			#10;
			sin = 1'b0;
			#10;
			#50;
			$finish;
		end
		
	initial
		$monitor("rst=%b,sin=%b,sout=%b",rst,sin,sout);
	
	initial
		begin
			$dumpfile("dump.vcd");
			$dumpvars;
		end
endmodule