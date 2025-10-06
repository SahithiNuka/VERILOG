module dual_syn_ram_16x8_tb();
	parameter WIDTH = 8,
			  DEPTH = 16,
			  ADDR_BUS = 4;
	reg clk,rst,we,re;
	reg [WIDTH-1:0]din;
	reg [ADDR_BUS-1:0]wr_addr,rd_addr;
	wire [WIDTH-1:0]dout;
	
	dual_syn_ram_16x8 RAM(clk,rst,we,re,wr_addr,rd_addr,din,dout);
	
	initial
		begin
			clk = 1'b0;
			forever #5 clk = ~clk;
		end
		
	task initialize();
		begin
			{wr_addr,rd_addr} = 8'b0;
			{rst,we,re} = 3'b100;
		end
	endtask
	
	task reset;
		begin
			@(negedge clk)
			rst = 1'b1;
			@(negedge clk)
			rst = 1'b0;
		end
	endtask
	
	task write(input [7:0]data, input [3:0]addr, input a);
		begin
			@(negedge clk)
			din = data;
			wr_addr = addr;
			we = a;
		end
	endtask
	
	task read(input [3:0]addr, input a);
		begin
			@(negedge clk)
			rd_addr = addr;
			re = a;
		end
	endtask
	
	initial
		begin
			initialize;
			reset;
			#10;
			write({$random},4'b1010,1'b1);
			#10;
			read(4'b1010,1'b1);
			#10;
			reset;
			$finish;
		end
		
	initial
		$monitor("rst=%b,we=%b,re=%b,wr_addr=%b,rd_addr=%b,din=%d,dout=%d",rst,we,re,wr_addr,rd_addr,din,dout);
	initial
		begin
			$dumpfile("dump.vcd");
			$dumpvars;
		end
endmodule