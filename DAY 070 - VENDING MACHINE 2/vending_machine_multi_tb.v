`timescale 1ns/1ps
module tb_vending_machine_multi_v2();

    reg clk, reset;
    reg [1:0] coin;
    reg [1:0] select;
    wire dispense_A, dispense_B;
    wire [1:0] change;

    // Instantiate DUT (Device Under Test)
    vending_machine_multi_v2 dut (
        .clk(clk),
        .reset(reset),
        .coin(coin),
        .select(select),
        .dispense_A(dispense_A),
        .dispense_B(dispense_B),
        .change(change)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Task for coin insertion
    task insert_coin(input [1:0] c);
    begin
        coin = c;
        #10 coin = 2'b00; // simulate coin removal
    end
    endtask

    // Task for product selection
    task select_product(input [1:0] s);
    begin
        select = s;
        #10 select = 2'b00; // simulate button release
    end
    endtask

    initial begin
        $dumpfile("vending_machine_multi_v2.vcd");
        $dumpvars(0, tb_vending_machine_multi_v2);

        clk = 0;
        reset = 1; coin = 0; select = 0;
        #10 reset = 0;

        // Scenario 1: Buy A with exact 10 units
        $display("\n--- Scenario 1: Buy A with 10 units ---");
        insert_coin(2'b10); // +10
        select_product(2'b01); // Select A
        #20;

        // Scenario 2: Buy B with exact 15 units (5 + 10)
        $display("\n--- Scenario 2: Buy B with 15 units ---");
        insert_coin(2'b01); // +5
        insert_coin(2'b10); // +10
        select_product(2'b10); // Select B
        #20;

        // Scenario 3: Overpay for A (15 units → expect 5 change)
        $display("\n--- Scenario 3: Buy A with 15 units (expect 5 change) ---");
        insert_coin(2'b10); // +10
        insert_coin(2'b01); // +5
        select_product(2'b01); // Select A
        #20;

        // Scenario 4: Overpay for A (20 units → expect 10 change)
        $display("\n--- Scenario 4: Buy A with 20 units (expect 10 change) ---");
        insert_coin(2'b10); // +10
        insert_coin(2'b10); // +10
        select_product(2'b01); // Select A
        #20;

        // Scenario 5: Overpay for B (20 units → expect 5 change)
        $display("\n--- Scenario 5: Buy B with 20 units (expect 5 change) ---");
        insert_coin(2'b10); // +10
        insert_coin(2'b10); // +10
        select_product(2'b10); // Select B
        #20;

        $display("\n--- Simulation complete ---");
        $finish;
    end

endmodule
