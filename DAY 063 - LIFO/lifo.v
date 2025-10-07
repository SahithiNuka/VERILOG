
module lifo(clk, rst, write_en, read_en, din, empty, full, dout);
	parameter WIDTH = 8, STACK_DEPTH = 16;
	
	input clk,rst,write_en,read_en;
	input [WIDTH-1:0]din;
	output empty,full;
	output reg [WIDTH-1:0]dout;
	
	reg [4:0]ptr;
	reg [4:0]lifo_counter;
	
	reg [WIDTH-1:0] mem [STACK_DEPTH-1:0];
	
	integer i;
	
	assign empty = (lifo_counter == 5'b0) ? 1'b1 : 1'b0;
	assign full = (lifo_counter > 5'b01111);
	
	
	always@(posedge clk or negedge rst)
		begin
			if(!rst)
				lifo_counter <= 0;
			else if(!full && write_en)
				lifo_counter <= lifo_counter + 1;
			else if(!empty && read_en)
				lifo_counter <= lifo_counter - 1;
		end
		
	always@(posedge clk or negedge rst)
		begin
			if(!rst)
				begin
					for(i=0; i<16; i=i+1)
						begin
							mem[i] <= 0;
							ptr <= 5'b0;
						end
				end
			else if((write_en == 1'b1) && (full == 1'b0))
				begin
					mem[ptr] <= din;
					ptr = ptr + 1'b1;
				end
		end
		
	always@(posedge clk or negedge rst)
		begin
			if(!rst)
				begin
					dout <= 8'b0;
				end
			else if((read_en == 1'b1) && (empty == 1'b0))
				begin
					dout <= mem[ptr - 1'b1];
					ptr <= ptr - 1'b1;
				end
		end

endmodule