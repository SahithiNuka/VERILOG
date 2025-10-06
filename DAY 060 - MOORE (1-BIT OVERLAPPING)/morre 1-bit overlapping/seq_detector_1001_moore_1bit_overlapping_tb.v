module seq_detector_1001_moore_1bit_overlapping_tb();
	reg clk,rst,din;
	wire dout;
	
	seq_detector_1001_moore_1bit_overlapping uut(clk,rst,din,dout);
	
	initial
		begin
			clk = 1'b1;
			forever #5 clk = !clk;
		end
		
	// Task to apply one bit input in sync with clock 
	task apply_bit(input value);
		begin
			@(negedge clk);
			din = value;
			@(posedge clk); // wait for clock positive edge to latch
		end
	endtask
	
	initial begin
		rst = 1;
		din = 0;
		#15;
		rst = 0;
		
		// Apply input bits with interval of one clock cycle
		// Sequence: 1001 (should detect)
		apply_bit(1);
		apply_bit(0);
		apply_bit(0);
		apply_bit(1);
		
		// Random bits no detection
		apply_bit(1);
		apply_bit(1);
		apply_bit(0);
		apply_bit(1);
		
		//Sequence detection
		apply_bit(1);
		apply_bit(0);
		apply_bit(0);
		apply_bit(1);
		
		//1-bit overlapping behaviour
		apply_bit(0);
		apply_bit(0);
		apply_bit(1);
		apply_bit(1);

		#20;
		$finish;
	end

	initial begin
		$monitor("t=%t, rst=%b, din=%b, dout=%b",$time,rst,din,dout);
	end
  
	initial
		begin
			$dumpfile("dump.vcd");
			$dumpvars;
		end

endmodule
