module single_asyn_ram_8x16_tb();
	parameter WIDTH = 16,
			  DEPTH = 8,
			  ADDR_BUS = 3;
	
	reg clk,rst,we,re;
	reg [ADDR_BUS-1:0]addr;
	wire [WIDTH-1:0]data;
	
	reg [WIDTH-1:0]temp_data;
	
	integer i;
	
	single_asyn_ram_8x16 RAM(clk,rst,we,re,addr,data);
	
	initial
		begin
			clk = 1'b0;
			forever #5 clk = ~clk;
		end
		
	assign data = (!re && we) ? temp_data : 16'hz;
	
	task initialize;
		begin
			{rst,we,re} = 3'b100;
			addr = 3'b0;
			temp_data = 16'b0;
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
	
	task data_write(input [2:0]address, input [15:0]din);
		begin
			@(negedge clk)
			addr = address;
			temp_data = din;
		end
	endtask
	
	task write;
		begin
			{we,re} = 2'b10;
		end
	endtask
	
	task read;
		begin
			{we,re} = 2'b01;
		end
	endtask
	
	task delay;
		begin
			#10;
		end
	endtask
	
	initial
		begin
			initialize;
			reset;
			delay;
			write;
			data_write(3'b101,16'hA465);
			delay;
			read;
			delay;
			reset;
			$finish;
		end
	
	initial
		begin
			$dumpfile("dump.vcd");
			$dumpvars;
		end
endmodule