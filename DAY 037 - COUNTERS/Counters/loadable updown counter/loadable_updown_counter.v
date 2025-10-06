module loadable_updown_counter(clk,rst,load,mode,din,dout);
	input clk,rst,load,mode;
	input [4:0]din;
	output reg[4:0]dout;
	
	always@(posedge clk)
		begin
			if(rst)
				dout <= 5'b0;
			else if(load)
				dout <= din;
			else
				begin
					if(mode)
						dout <= dout + 1'b1;
					else
						dout <= dout - 1'b1;
				end
		end
endmodule