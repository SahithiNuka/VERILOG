module single_syn_ram_16x8(clk,rst,we,re,addr,data);
	parameter WIDTH = 8,
			  DEPTH = 16,
			  ADDR_BUS = 4;
	
	input clk,rst,we,re;
	input [ADDR_BUS-1:0]addr;
	inout [WIDTH-1:0]data;
	
	reg [WIDTH-1:0]mem[DEPTH-1:0];
	
	reg [WIDTH-1:0]temp;
	
	always@(posedge clk)
		begin
			if(rst)
				temp <= 8'b0;
			else
				begin
					if(we && !re)
						mem[addr] <= data;
					if(!we && re)
						temp <= mem[addr];
				end
		end
		
	assign data = (re && !we) ? temp : 8'hz;
endmodule