module vending_machine_multi_tb();

    reg clk, reset;
    reg [1:0] coin;       // 00: no coin, 01: 5 units, 10: 10 units
    reg [1:0] select;     // 01: select A, 10: select B
    wire dispense_A, dispense_B;
    wire [1:0] change;

    vending_machine_multi (clk,reset,coin,select,dispense_A,dispense_B,change);

    // Clock generation
	initial
		begin
			clk = 1'b0;
			forever #5 clk = !clk;
		end

    // Task for inserting coin
    task insert_coin(input [1:0] c);
        begin
            coin = c;
            #10 coin = 2'b00; // release after one cycle
        end
    endtask

    // Task for selecting product
    task select_item(input [1:0] s);
        begin
            select = s;
            #10 select = 2'b00; // release after one cycle
        end
    endtask

    // Test sequence
    initial begin
        clk = 0;
        reset = 1;
        coin = 2'b00;
        select = 2'b00;
        #20 reset = 0;

        $display("\n--- Test 1: Exact amount for Product A (10 units) ---");
        insert_coin(2'b10);   // insert 10
        select_item(2'b01);   // select A
        #20;

        $display("\n--- Test 2: Overpay for Product A (15 units → return 5) ---");
        insert_coin(2'b10);   // 10
        insert_coin(2'b01);   // +5
        select_item(2'b01);   // select A → expect change = 5
        #20;

        $display("\n--- Test 3: Exact amount for Product B (15 units) ---");
        insert_coin(2'b10);   // 10
        insert_coin(2'b01);   // +5
        select_item(2'b10);   // select B → no change
        #20;

        $display("\n--- Test 4: Invalid selection (not enough money) ---");
        insert_coin(2'b01);   // only 5
        select_item(2'b10);   // try selecting B (should not dispense)
        #20;

        $display("\n--- Test 5: Reset behavior ---");
        reset = 1; #10 reset = 0;
        insert_coin(2'b10);
        select_item(2'b01);   // normal operation again
        #20;

        $display("\n--- Simulation Complete ---");
        #50
		$finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t,Coin=%b,Select=%b,A=%b,B=%b,Change=%b,State=%b",$time, coin, select, dispense_A, dispense_B, change, dut.state);
    end
  
  initial
		begin
			$dumpfile("dump.vcd");
			$dumpvars;
		end

endmodule
