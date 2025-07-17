module dual_asyn_ram_8x16_tb();
	parameter WIDTH = 16,
			  DEPTH = 8,
			  ADDR_BUS = 3;
	reg clk,rst,we,re;
	reg [WIDTH-1:0]din;
	reg [ADDR_BUS-1:0]wr_addr,rd_addr;
	wire [WIDTH-1:0]dout;
	
	dual_asyn_ram_8x16 RAM(clk,rst,we,re,wr_addr,rd_addr,din,dout);
	
	initial
		begin
			clk = 1'b0;
			forever #5 clk = ~clk;
		end
		
	task initialize();
		begin
			{wr_addr,rd_addr} = 6'b0;
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
	
	task write(input [15:0]data, input [2:0]addr, input a);
		begin
			@(negedge clk)
			din = data;
			wr_addr = addr;
			we = a;
		end
	endtask
	
	task read(input [2:0]addr, input a);
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
			write({$random},3'b101,1'b1);
			#10;
			read(3'b101,1'b1);
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