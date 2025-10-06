module seq_detector_10010_mealy_2bit_overlapping(clk,reset,din,dout);
	input clk,reset,din;
	output reg dout;
	
	parameter S0 = 3'b000,
			  S1 = 3'b001,
			  S2 = 3'b010,
			  S3 = 3'b011,
			  S4 = 3'b100;
	
	reg[2:0]p_state,n_state; //present state & next state
	
	//present state logic
	always@(posedge clk or posedge reset)
		begin
			if(reset)
				p_state <= S0;
			else
				p_state <= n_state;
		end
		
	//next state logic
	always@(*)
		begin
			dout = 1'b0;
			case(p_state)
				S0: begin
					if(din)
						n_state = S1;
					else
						n_state = S0;
				end
				S1: begin
					if(din)
						n_state = S1;
					else
						n_state = S2;
				end
				S2: begin
					if(din)
						n_state = S1;
					else
						n_state = S3;
				end
				S3: begin
					if(din)
						n_state = S4;
					else
						n_state = S0;
				end
				S4: begin
					if(din)
						n_state = S1;
					else
						begin
							n_state = S2;
							dout = 1'b1;
						end
				end
				default: begin
					n_state = S0;
					dout = 1'b1;
				end
			endcase
		end
endmodule