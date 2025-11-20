module clock_divider (clk,rst,divby2,divby4, divby8, divby16);
	input clk, rst;
	output reg divby2, divby4, divby8, divby16;

	reg [3:0] count=4'b0000;

	always @(posedge clk) 
		begin
			if (rst == 0) 
				begin
					count <= 4'b0000;
				end 
			else 
				begin
					count <= count + 1;
				end
    
			divby2 <= count[0];
			divby4 <= count[1];
			divby8 <= count[2];
			divby16 <= count[3];
		end

endmodule



