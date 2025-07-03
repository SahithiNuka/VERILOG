module loadable_updown_counter_tb();
	reg clk,rst,load,mode;
	reg [4:0]din;
	wire [4:0]dout;
	
	loadable_updown_counter ludc(clk,rst,load,mode,din,dout);
	
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
			din = 4'b1111;
			load = 1'b1;
			#10;
			din = 4'b0;
			load = 1'b0;
			mode = 1'b1;
			#100;
			mode = 1'b0;
			#80;
			$finish;
		end
	initial
		$monitor("rst=%b,load=%b,mode=%b,din=%d,dout=%d",rst,load,mode,din,dout);
		
	initial
		begin
			$dumpfile("dump.vcd");
			$dumpvars;
		end
endmodule