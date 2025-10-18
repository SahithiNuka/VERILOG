module gray_counter_tb();
	reg clk,rst,updown;
	wire [3:0]gray;
	
	 gray_counter gc(clk,rst,updown,gray);
	 
	 initial
		begin
			clk = 1'b0;
			forever #5 clk = ~clk;
		end
		
	initial
		begin
			rst = 1'b1;
			#10;
			rst = 1'b0;
			updown = 1'b1;
			#150;
			updown = 1'b0;
			#150;
			$finish;
		end
	initial
		$monitor("time=%t,rst=%b,updown=%b,gray=%b",$time,rst,updown,gray);
	
	initial
		begin
			$dumpfile("dump.vcd");
			$dumpvars;
		end
endmodule