
module programmable_fixed_priority_tb;

    reg  [3:0] req;
    reg  [7:0] priority_order;
    wire [3:0] grant;


    programmable_fixed_priority DUT (req,priority_order,grant);


    // Task for formatted display
    task display_state;
        begin
            $display("Time=%0t | Priority=%b | Req=%b | Grant=%b",
                     $time, priority_order, req, grant);
        end
    endtask

    initial begin
        $display("\n===== PROGRAMMABLE FIXED PRIORITY ARBITER TEST =====\n");
        $display("Format: Time | Priority (2 bits per req: R3R2R1R0) | Req | Grant\n");

        // TEST 1: Default Priority (R0>R1>R2>R3)
        priority_order = 8'b11_10_01_00; // R0=00 (highest), R1=01, R2=10, R3=11
        req = 4'b0000; #10; display_state();

        req = 4'b0001; #10; display_state(); // R0 active → G0
        req = 4'b0011; #10; display_state(); // R0,R1 active → G0
        req = 4'b0110; #10; display_state(); // R1,R2 active → G1
        req = 4'b1111; #10; display_state(); // All active → G0

        // TEST 2: Custom Priority (R2>R0>R3>R1)
        $display("\n-- Changing Priority: R2 > R0 > R3 > R1 --\n");
        priority_order = 8'b01_11_00_10; // R0=10, R1=00, R2=11, R3=01 (encoded)
        // (Interpreted: R2 highest, then R0, then R3, then R1)

        req = 4'b1111; #10; display_state(); // All active → G2
        req = 4'b0101; #10; display_state(); // R0,R2 active → G2
        req = 4'b0010; #10; display_state(); // R1 active → G1
        req = 4'b0001; #10; display_state(); // R0 active → G0

        // TEST 3: Dynamic Priority Change
        $display("\n-- Changing Priority Dynamically while Requests Stay Same --\n");
        req = 4'b1011; // R3,R1,R0 active

        priority_order = 8'b11_10_01_00; #10; display_state(); // R0 highest → G0
        priority_order = 8'b00_01_10_11; #10; display_state(); // R3 highest → G3
        priority_order = 8'b10_00_11_01; #10; display_state(); // R1 highest → G1

        // TEST 4: Single Active Request
        $display("\n-- Single Active Request Checks --\n");
        priority_order = 8'b11_10_01_00;
        req = 4'b0001; #10; display_state();
        req = 4'b0010; #10; display_state();
        req = 4'b0100; #10; display_state();
        req = 4'b1000; #10; display_state();
        $finish;
    end

endmodule
