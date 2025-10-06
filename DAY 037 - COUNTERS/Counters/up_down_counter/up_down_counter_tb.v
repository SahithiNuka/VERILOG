module up_down_counter_tb();
	reg clk,rst,m;
	wire [4:0]count;
	
	integer i,j;
	
	up_down_counter udc(clk,rst,m,count);
	
	initial
		begin
			clk = 1'b0;
			forever #5 clk = ~clk;
		end
		
	initial
		begin
			rst = 1'b1;
			#10;
			$display("rst=%b,count=%d",rst,count);
			for(i=0; i<2; i=i+1)
				begin
					m = i;
					for(j=0; j<32; j=j+1)
						begin
							rst = 1'b0;
							#10;
							$display("rst=%b,count=%d",rst,count);
						end
				end
			$finish;
		end
	
	initial
		begin
			$dumpfile("dump.vcd");
			$dumpvars;
		end
endmodule