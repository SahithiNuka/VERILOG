module sram(clk,we,addr,wdata,rdata);
	input clk,we;
	input [3:0] addr;
	input [15:0] wdata;
	output reg [15:0] rdata;
    
	reg [15:0] sram_mem [0:15];
	integer i;
    
	initial 
		begin
			for(i=0; i<16; i=i+1) 
				begin
					sram_mem[i]=0;
				end
			rdata=0;
		end
    
    always @ (posedge clk) 
		begin
			if(we) 
				begin
					sram_mem[addr] <= wdata;
				end
			else 
				begin
					rdata <= sram_mem[addr];
				end
		end
endmodule