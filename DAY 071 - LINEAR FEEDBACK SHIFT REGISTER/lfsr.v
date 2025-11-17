module lfsr(clk,rst,op);
	input clk,rst;
	output reg[3:0]op;

	always@(posedge clk)
		begin
			if(rst)
				op <= 4'hF;
			else
				op <= {op[2:0],(op[3] ^ op[2])};
		end
		
endmodule