// Vending Machine Example (Two Products, with exact change handling)
// Product A = 10 units
// Product B = 15 units
// Accepts 5 and 10 unit coins
// Returns correct change (5 or 10 units)

module vending_machine_multi_v2 (
    input clk,
    input reset,
    input [1:0] coin,       // 00: no coin, 01: 5 units, 10: 10 units
    input [1:0] select,     // 01: select A, 10: select B
    output reg dispense_A,  // dispense signal for item A
    output reg dispense_B,  // dispense signal for item B
    output reg [1:0] change // 00: no change, 01: 5 units back, 10: 10 units back
);

    // State encoding for balance
    parameter S0  = 3'b000; // 0 units
    parameter S5  = 3'b001; // 5 units
    parameter S10 = 3'b010; // 10 units
    parameter S15 = 3'b011; // 15 units
    parameter S20 = 3'b100; // 20 units

    reg [2:0] state, next_state;

    // Sequential logic (state update)
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    // Combinational logic (next state and outputs)
    always @(*) begin
        // Default outputs
        next_state = state;
        dispense_A = 0;
        dispense_B = 0;
        change = 2'b00;

        case (state)
            // 0 units
            S0: begin
                if (coin == 2'b01)
                    next_state = S5;
                else if (coin == 2'b10)
                    next_state = S10;
                else
                    next_state = S0;
            end

            // 5 units
            S5: begin
                if (coin == 2'b01)
                    next_state = S10;
                else if (coin == 2'b10)
                    next_state = S15;
                else
                    next_state = S5;
            end

            // 10 units
            S10: begin
                if (select == 2'b01) begin
                    dispense_A = 1;       // Cost = 10
                    next_state = S0;
                end else if (coin == 2'b01)
                    next_state = S15;     // 10 + 5 = 15
                else if (coin == 2'b10)
                    next_state = S20;     // 10 + 10 = 20
                else
                    next_state = S10;
            end

            // 15 units
            S15: begin
                if (select == 2'b01) begin
                    dispense_A = 1;       // A costs 10 → return 5
                    change = 2'b01;
                    next_state = S0;
                end else if (select == 2'b10) begin
                    dispense_B = 1;       // B costs 15 → exact
                    next_state = S0;
                end else
                    next_state = S15;
            end

            // 20 units
            S20: begin
                if (select == 2'b01) begin
                    dispense_A = 1;       // A costs 10 → return 10
                    change = 2'b10;
                    next_state = S0;
                end else if (select == 2'b10) begin
                    dispense_B = 1;       // B costs 15 → return 5
                    change = 2'b01;
                    next_state = S0;
                end else
                    next_state = S20;
            end

            default: next_state = S0;
        endcase
    end

endmodule
