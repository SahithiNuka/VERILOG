module dual_syn_ram_16x8(clk,rst,we,re,wr_addr,rd_addr,din,dout);
	parameter WIDTH = 8,
			  DEPTH = 16,
			  ADDR_BUS = 4;
	input clk,rst,we,re;
	input [WIDTH-1:0]din;
	input [ADDR_BUS-1:0]wr_addr,rd_addr;
	output reg [WIDTH-1:0]dout;

	//memory declaration
	reg [WIDTH-1:0]mem[DEPTH-1:0];
	
	integer i;
	
	always@(posedge clk)
		begin
			if(rst)
				begin
					dout <= 8'b0;
					for(i=0; i<16; i=i+1)
						mem[i] <= 0;
				end
			else
				begin
					if(we)
						mem[wr_addr] <= din;
					if(re)
						dout <= mem[rd_addr];
				end
		end
		
endmodule