module seq_detector_0110_1bit_mealy_overlapping_tb;

	reg clk;
	reg reset;
	reg din;
	wire dout;
	
  	seq_detector_0110_1bit_mealy_overlapping uut (clk,reset,din,dout);

	initial
		begin
			clk=1'b1;
			forever #5 clk = ~clk;
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
		reset = 1;
		din = 0;
		#15;
		reset = 0;

		// Apply input bits with interval of one clock cycle
		// Sequence: 0110(should detect)
		apply_bit(0);
		apply_bit(1);
		apply_bit(1);
		apply_bit(0);

		// Some random bits t
		apply_bit(0);
		apply_bit(1);
		apply_bit(0);
		apply_bit(1);

		// Random bits detection
		apply_bit(0);
		apply_bit(1);
		apply_bit(1);
		apply_bit(0);

		// Detect another sequence (1-bit overlapping behaviour)
		apply_bit(1);
		apply_bit(1);
		apply_bit(0);
		apply_bit(1);

		#20;
		$stop;
	end

	initial begin
		$monitor("t=%t, reset=%b, din=%b, dout=%b",$time,reset,din,dout);
	end
  
	initial
		begin
			$dumpfile("dump.vcd");
			$dumpvars;
		end

endmodule
