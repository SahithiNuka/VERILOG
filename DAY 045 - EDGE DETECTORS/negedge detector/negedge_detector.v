module negedge_detector(clk,data,negedge_detect);
	input clk,data;
	output negedge_detect;
	
	reg data_d;
	
	always@(posedge clk)
		begin
			data_d <= data;
		end
	assign negedge_detect = (~data) & (data_d);
endmodule