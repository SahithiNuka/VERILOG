module time_count_tb();
	reg clk,rst;
	wire [3:0]ms_hr,ls_hr,ms_min,ls_min,ms_sec,ls_sec;
	
	time_count dut(clk,rst,ms_hr,ls_hr,ms_min,ls_min,ms_sec,ls_sec);
	
	initial
		begin
			clk = 1'b0;
			forever #0.5 clk = !clk;
		end
		
	task reset;
		begin
			@(negedge clk);
			rst = 1'b1;
			@(negedge clk);
			rst = 0;
		end
	endtask
	
	initial
		begin
			reset;
			#(25*60*60);
			$finish;
		end
	
	initial
		begin
			$monitor("Time = %d%d : %d%d : %d%d",ms_hr,ls_hr,ms_min,ls_min,ms_sec,ls_sec);
		end
		
endmodule