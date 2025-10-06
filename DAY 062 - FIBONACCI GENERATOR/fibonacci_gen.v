
module fibonacci_gen(clk,rst,prsnt,next);
	input clk,rst;
	output reg [15:0]prsnt,next;
	
	always@(posedge clk or posedge rst)
		begin
			if(rst)
				begin
					prsnt <= 0;
					next <= 1;
				end
			
			else
				begin
					{prsnt, next} <= {next, prsnt + next};
				end
		end
endmodule
