module mod_12_counter_tb();
	reg clk,rst,load,mode;
	reg [3:0]din;
	wire [3:0]dout;
	
	mod_12_counter counter(clk,rst,load,mode,din,dout);
	
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
			load = 1'b1;
			din = 4'b1000;
			#10;
			load = 1'b0;
			mode = 1'b1;
			#60;
			mode = 1'b0;
			#50;
			$finish;
		end
	initial
		$monitor("rst=%b,load=%b,mode=%b,din=%b,dout=%b",rst,load,mode,din,dout);
		
	initial
		begin
			$dumpfile("dump.vcd");
			$dumpvars;
		end
endmodule