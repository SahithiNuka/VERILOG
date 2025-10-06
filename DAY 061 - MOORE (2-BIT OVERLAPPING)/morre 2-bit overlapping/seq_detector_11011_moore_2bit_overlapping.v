module seq_detector_11011_moore_2bit_overlapping(clk,rst,din,dout);
	input clk,rst,din;
	output dout;
	
	parameter S0 = 3'b000,
			  S1 = 3'b001,
			  S2 = 3'b010,
			  S3 = 3'b011,
			  S4 = 3'b100,
			  S5 = 3'b101;
			  
	reg [2:0]p_state, n_state; //present state & next state
	
	//present state logic
	always@(posedge clk or posedge rst)
		begin
			if(rst)
				p_state <= S0;
			else
				p_state <= n_state;
		end
		
	//next state logic
	always@(*)
		begin
			n_state = S0;
			case(p_state)
				S0: begin
					if(din)
						n_state = S1;
					else
						n_state = S0;
				end
				S1: begin
					if(din)
						n_state = S2;
					else
						n_state = S0;
				end
				S2: begin
					if(din)
						n_state = S2;
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
						n_state = S5;
					else
						n_state = S0;
				end
				S5: begin
					if(din)
						n_state = S2;
					else
						n_state = S3;
				end
			endcase
		end
	
	//output logic
	assign dout = (p_state == S5);
endmodule