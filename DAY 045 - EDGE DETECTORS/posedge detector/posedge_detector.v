module posedge_detector(clk,data,posedge_detect);
	input clk,data;
	output posedge_detect;
	
	reg data_d;
	
	always@(posedge clk)
		begin
			data_d <= data;
		end
		
	assign posedge_detect = (data) & (~data_d);
endmodule