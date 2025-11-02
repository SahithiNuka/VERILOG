// Simple Vending Machine FSM
// Accepts 5 and 10 unit coins
// Product cost = 15 units

module vending_machine (clk,reset,coin,dispense);
	input clk;
	input reset;
	input [1:0] coin;   // 00: no coin, 01: 5 units, 10: 10 units
	output reg dispense; // 1: product dispensed

    // State encoding
	parameter S0 = 2'b00, // 0 units
			  S5 = 2'b01, // 5 units
			  S10 = 2'b10, // 10 units
			  S15 = 2'b11; // 15 or more units (dispense)

	reg [1:0] state, next_state;

	// State transition
	always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        dispense = 0;
        case (state)
            S0: begin
                case (coin)
                    2'b01: next_state = S5;
                    2'b10: next_state = S10;
                    default: next_state = S0;
                endcase
            end
            S5: begin
                case (coin)
                    2'b01: next_state = S10; // 5+5 = 10
                    2'b10: next_state = S15; // 5+10 = 15
                    default: next_state = S5;
                endcase
            end
            S10: begin
                case (coin)
                    2'b01: next_state = S15; // 10+5 = 15
                    2'b10: next_state = S15; // 10+10 = 20 → dispense
                    default: next_state = S10;
                endcase
            end
            S15: begin
                dispense = 1;
                next_state = S0; // Reset after dispensing
            end
            default: next_state = S0;
        endcase
    end

endmodule
