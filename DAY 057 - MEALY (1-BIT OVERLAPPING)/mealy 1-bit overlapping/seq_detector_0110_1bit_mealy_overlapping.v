module seq_detector_0110_1bit_mealy_overlapping(clk,reset,din,dout);
	input clk,reset;
	input din;
	output reg dout;
	
	parameter S0=2'b00,
			  S1=2'b01,
			  S2=2'b10,
			  S3=2'b11;
			  
	reg[1:0]p_state,n_state; //present state and next state
	
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
						n_state = S0;
					else
						n_state = S1;
				end
				S1: begin
					if(din)
						n_state = S2;
					else
						n_state = S1;
				end
				S2: begin
					if(din)
						n_state = S3;
					else
						n_state = S1;
				end
				S3: begin
					if(din)
						n_state = S0;
					else
						begin
							n_state = S1;
							dout = 1'b1;
						end
				end
				default: begin
							n_state = S0;
							dout = 1'b0;
						end
			endcase
		end
endmodule