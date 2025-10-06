module async_fifo_8x16_tb();
	parameter WIDTH=16, DEPTH=8, ADDR_BUS=3;
	
	reg clk,rst,we,re;
	reg [WIDTH-1:0]din;
	wire full,empty;
	wire [WIDTH-1:0]dout;
	
	async_fifo_8x16 FIFO(clk,rst,we,re,din,empty,full,dout);
	
	initial
		begin
			clk = 1'b0;
			forever #5 clk = ~clk;
		end
		
	task initialize;
		begin
			{rst,we,re} = 3'b000;
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
	
	task write_fifo(input [15:0]data);
		begin
			@(negedge clk)
			we = 1'b1;
			din = data;
		end
	endtask
	
	task read_fifo;
		begin
			@(negedge clk)
			re = 1'b1;
		end
	endtask
	
	initial
		begin
			initialize;
			reset;
			repeat(9)
				write_fifo({$random}%8);
			we = 1'b0;
			repeat(9)
				read_fifo;
			re = 1'b0;
			reset;
			$finish;
		end
		
	initial
		begin
			$dumpfile("dump.vcd");
			$dumpvars;
		end
endmodule