module fibonacci__gen_tb;
	reg clk,rst;
	wire [15:0]prsnt,next;
	
	fibonacci_gen fg(clk,rst,prsnt,next);
	
	initial
		begin
			clk = 1'b0;
			forever #5 clk = !clk;
		end
		
	initial
		begin
			rst = 1'b1;
			#10;
			rst = 1'b0;
			#100;
			$finish;
		end
		
	initial
		$monitor("time=%t, rst=%b, prsnt=%d, next=%d",$time,rst,prsnt,next);

endmodule
