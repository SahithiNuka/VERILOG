module negedge_detector_tb();
	reg clk,data;
	wire negedge_detect;
	
	negedge_detector nd(clk,data,negedge_detect);
	
	initial
		begin
			clk = 1'b0;
			forever #5 clk = ~clk;
		end
		
	initial
		begin
			data = 0;
			#15; data = 1'b1;
			#20; data = 1'b0;
			#15; data = 1'b1;
			#20; data = 1'b1; 
			#15; data = 1'b1;
			#20; data = 1'b0; 
			#15; data = 1'b1;
			#20; data = 1'b0; 
			#15; data = 1'b0;
			#20; data = 1'b0; 
			#15; data = 1'b1;
			#20; data = 1'b0; 
			#15; data = 1'b1;
			#20; data = 1'b1; 
			#15; data = 1'b0;
			#20; data = 1'b0; 
			#15; data = 1'b1;
			#10;
			$finish;
		end
	initial
		begin
			$dumpfile("dump.vcd");
			$dumpvars;
		end
		
endmodule