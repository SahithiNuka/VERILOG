module bin_to_onehot(en,bin,one_hot);
	input en;
	input [3:0]bin;
	output reg[31:0]one_hot;
	
	always@(*)
		begin
			if(en)
				one_hot = 1'b1<<bin;
			else
				one_hot = 1'b1>>bin;
		end
endmodule