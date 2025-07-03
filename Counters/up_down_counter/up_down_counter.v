module up_down_counter(clk,rst,m,count);
	input clk,rst,m;
	output reg [4:0]count;
	
	always@(posedge clk)
		begin
			if(rst)
				count <= 5'b0;
			else if(m == 1)
				count <= count + 1'b1;
			else
				count <= count - 1'b1;
		end
endmodule