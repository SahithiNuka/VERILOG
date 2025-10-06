module johnson_counter(clk,rst,q);
	input clk,rst;
	output [3:0]q;
	
	reg [3:0]a;
	
	always@(posedge clk)
		begin
			if(rst)
				a = 4'b1000;
			else
				a = {~a[0],a[3:1]};
		end
	assign q = a;
endmodule