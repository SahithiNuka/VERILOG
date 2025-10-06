module sr_flipflop(s,r,clk,rst,q,qb);
	input s,r,clk,rst;
	output reg q;
  	output qb;
  
	always@(posedge clk)
		begin
			if(rst)
				begin
					q <= 1'b0;
				end
			else if(s==1'b0 && r==1'b0)
				begin
					q <= q;
				end
			else if(s==1'b0 && r==1'b1)
				begin
					q <= 1'b0;
				end
			else if(s==1'b1 && r==1'b0)
				begin
					q <= 1'b1;
				end
			else if(s==1'b1 && r==1'b1)
				begin
					q <= 1'bx;
				end
		end
  	assign qb = ~q;
endmodule