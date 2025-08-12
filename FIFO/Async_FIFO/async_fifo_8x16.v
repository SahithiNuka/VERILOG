module async_fifo_8x16(clk,rst,we,re,din,empty,full,dout);
	parameter WIDTH=16, DEPTH=8, ADDR_BUS=3;
	
	input clk,rst,we,re;
	input [WIDTH-1:0]din;
	output empty,full;
	output reg[WIDTH-1:0]dout;
	
	reg [ADDR_BUS-1:0]wr_pt=4'b0;
	reg [ADDR_BUS-1:0]rd_pt=4'b0;
	
	reg [3:0]fifo_counter;
	
	reg [WIDTH-1:0] mem [DEPTH-1:0];
	
	integer i;
	
	assign empty = (fifo_counter == 0) ? 1'b1 : 1'b0;
	assign full = (fifo_counter == 16) ? 1'b1 : 1'b0;
	
	//counter logic
	always@(posedge clk or posedge rst)
		begin
			if(rst)
				fifo_counter <= 4'b0;
			else if(!full && we)
				fifo_counter <= fifo_counter + 1'b1;
			else if(!empty && re)
				fifo_counter <= fifo_counter - 1'b1;
			else
				fifo_counter <= fifo_counter;
		end
		
	//write operation
	always@(posedge clk or posedge rst)
		begin
			if(rst)
				begin
					for(i=0; i<16; i=i+1)
						begin
							mem[i] <= 0;
							wr_pt <= 0;
						end
				end
			else if(we && !full)
				begin
					mem[wr_pt] <= din;
					wr_pt <= wr_pt + 1'b1;
				end
			else
				wr_pt <= wr_pt;
		end
		
	// read operation
	always@(posedge clk or posedge rst)
		begin
			if(rst)
				begin
					rd_pt <= 4'b0;
					dout <= 8'b0;
				end
			else if(re && !empty)
				begin
					dout <= mem[rd_pt];
					rd_pt <= rd_pt + 1'b1;
				end
			else 
				rd_pt <= rd_pt;
		end
endmodule