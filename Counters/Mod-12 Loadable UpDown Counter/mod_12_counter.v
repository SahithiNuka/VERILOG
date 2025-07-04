module mod_12_counter(clk,rst,load,mode,din,dout);
	input clk,rst,load,mode;
	input [3:0]din;
	output reg[3:0]dout;
	
	always@(posedge clk)
		begin
			if(rst)
				dout <= 4'b0;
			else if(load)
				dout <= din;
			else if(mode)
				begin
					if(dout == 4'd11)
						dout <= 4'd0;
					else
						dout <= dout + 1'b1;
				end
			else
				begin
					if(dout == 4'd0)
						dout <= 4'd11;
					else
						dout <= dout - 1'b1;
				end
		end
endmodule