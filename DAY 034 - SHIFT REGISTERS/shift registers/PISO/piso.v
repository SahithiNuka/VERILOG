module piso(clk,rst,sel,pin,sout);
	input clk,rst,sel;
	input [3:0]pin;
	output reg sout;
  
	reg [3:0]temp;
  
	always@(posedge clk)
		begin
			if(rst)
				temp <= 4'b0;
			else if(sel == 0)
				temp <= pin;
			else
				begin
					sout <= temp[0];
					temp <= temp>>1;
				end
		end
endmodule