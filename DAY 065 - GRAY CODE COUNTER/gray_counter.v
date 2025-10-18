module gray_counter(clk,rst,updown,gray);
	input clk,rst,updown;
	output reg [3:0]gray;
	
	reg [3:0]binary;
	
	always@(posedge clk)
		begin
			if(rst)
				binary <= 4'b0;
			else if(updown)
				binary <= binary + 1'b1;
			else
				binary <= binary - 1'b1;
		end
		
	always@(*)
		begin
			gray = binary ^ (binary >> 1);
		end
endmodule