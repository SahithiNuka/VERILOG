module vending_machine_tb;

    reg clk, reset;
    reg [1:0] coin;
    wire dispense;

    vending_machine vm1(clk,reset,coin,dispense);

    // Clock generation
    always #5 clk = ~clk;

    initial 
		begin
			clk = 0; reset = 1; coin = 2'b00;
			#10 reset = 0;

			// Insert 5, then 10
			#10 coin = 2'b01;  // 5
			#10 coin = 2'b10;  // +10 = 15 (dispense)
			#10 coin = 2'b00;

			// Insert 10, then 5
			#20 coin = 2'b10;  // 10
			#10 coin = 2'b01;  // +5 = 15 (dispense)
			#10 coin = 2'b00;

			// Insert 10, then 10
			#20 coin = 2'b10;  // 10
			#10 coin = 2'b10;  // +10 = 20 (dispense)
			#10 coin = 2'b00;

			#20;
			$finish;
		end

	initial
		$monitor("rst=%b,coin=%b,dispense=%b",reset,coin,dispense);
		
	initial
		begin
			$dumpfile("dump.vcd");
			$dumpvars;
		end
endmodule
