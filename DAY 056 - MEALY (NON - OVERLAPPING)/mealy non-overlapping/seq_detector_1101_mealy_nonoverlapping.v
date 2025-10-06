
module seq_detector_1101_mealy_nonoverlapping(clk,reset,din,dout);
	input clk;
	input reset;
	input din;
	output reg dout;

	parameter S0=2'b00,
			  S1=2'b01,
			  S2=2'b10,
			  S3=2'b11;
			  
	reg[1:0]current_state,next_state;

	// State transition on clock edge or reset
	always @(posedge clk or posedge reset) begin
		if (reset)
			current_state <= S0;
		else
			current_state <= next_state;
	end

	// Next state logic and output logic
	always @(*) begin
		dout = 1'b0; // Default output
		case (current_state)
			S0: begin
				if (din) 
					next_state = S1;
				else
					next_state = S0;
			end
			S1: begin
				if (din)
					next_state = S2;
				else
					next_state = S0;
			end
			S2: begin
				if (~din)
					next_state = S3;
				else
					next_state = S2;
			end
			S3: begin
				if (din) begin
					dout = 1'b1;  // Sequence 1101 detected
					next_state = S0;  // Non-overlapping detector resets
				end else
					next_state = S0;
			end
			default: begin
				next_state = S0;
				dout = 1'b0;
			end
		endcase
	end

endmodule
