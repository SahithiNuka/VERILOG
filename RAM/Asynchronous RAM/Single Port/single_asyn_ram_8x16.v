module single_asyn_ram_8x16(clk,rst,we,re,addr,data);
	parameter WIDTH = 16,
			  DEPTH = 8,
			  ADDR_BUS = 3;
	
	input clk,rst,we,re;
	input [ADDR_BUS-1:0]addr;
	inout [WIDTH-1:0]data;
	
	reg [WIDTH-1:0]mem[DEPTH-1:0];
	
	reg [WIDTH-1:0]temp;
	
	always@(posedge clk or posedge rst)
		begin
			if(rst)
				temp <= 16'b0;
			else
				begin
					if(we && !re)
						mem[addr] <= data;
					if(!we && re)
						temp <= mem[addr];
				end
		end
		
	assign data = (re && !we) ? temp : 16'hz;
endmodule