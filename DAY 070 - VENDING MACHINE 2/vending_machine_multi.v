// Vending Machine Example (Two Products)
// Product A = 10 units
// Product B = 15 units
// Accepts 5 and 10 unit coins
// Returns change if amount exceeds product cost

module vending_machine_multi (clk,reset,coin,select,dispense_A,dispense_B,change);
    input clk;
    input reset;
    input [1:0] coin;      // 00: no coin, 01: 5 units, 10: 10 units
    input [1:0] select;     // 01: select A, 10: select B
    output reg dispense_A;  // dispense signal for item A
    output reg dispense_B;  // dispense signal for item B
    output reg [1:0] change; // 00: no change, 01: 5 units back


    // State encoding for balance
    parameter S0  = 2'b00;
    parameter S5  = 2'b01;
    parameter S10 = 2'b10;
    parameter S15 = 2'b11;

    reg [1:0] state, next_state;

    // Sequential logic (state update)
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    // Combinational logic (next state and outputs)
    always @(*) begin
        // Default
        next_state = state;
        dispense_A = 0;
        dispense_B = 0;
        change = 2'b00;

        case (state)
            S0: begin
                if (coin == 2'b01)
                    next_state = S5;
                else if (coin == 2'b10)
                    next_state = S10;
                else
                    next_state = S0;
            end

            S5: begin
                if (coin == 2'b01)
                    next_state = S10;
                else if (coin == 2'b10)
                    next_state = S15;
                else if (select == 2'b01 && state == S5)
                    next_state = S5; // Not enough money
                else
                    next_state = S5;
            end

            S10: begin
                if (select == 2'b01) begin
                    dispense_A = 1;
                    next_state = S0;
                end else if (coin == 2'b01 || coin == 2'b10)
                    next_state = S15;
                else
                    next_state = S10;
            end

            S15: begin
                if (select == 2'b01) begin
                    dispense_A = 1;
                    change = 2'b01; // 5 units back
                    next_state = S0;
                end else if (select == 2'b10) begin
                    dispense_B = 1;
                    next_state = S0;
                end else
                    next_state = S15;
            end
        endcase
    end

endmodule
