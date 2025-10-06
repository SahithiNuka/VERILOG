module up_counter(clk,rst,count);
	input clk,rst;
	output reg [5:0]count;
	
	always@(posedge clk)
		begin
			if(rst)
				count <= 6'b0;
			else
				count <= count + 1'b1;
		end
endmodule