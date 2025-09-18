module seq_detector_11011_moore_2bit_overlapping_tb();
	reg clk,rst,din;
	wire dout;
	
	seq_detector_11011_moore_2bit_overlapping uut(clk,rst,din,dout);
	
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
		// Sequence: 11011 (should detect)
		apply_bit(1);
		apply_bit(1);
		apply_bit(0);
		apply_bit(1);
		apply_bit(1);
		
		// Random bits no detection
      	apply_bit(0);
		apply_bit(0);
		apply_bit(1);
		apply_bit(1);
      	apply_bit(1);
		
		// Detect another sequence
		apply_bit(1);
		apply_bit(1);
		apply_bit(0);
		apply_bit(1);
		apply_bit(1);
		
		//2-bit overlapping
		apply_bit(0);
		apply_bit(1);
		apply_bit(1);
		apply_bit(0);

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
