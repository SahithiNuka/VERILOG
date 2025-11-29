module barrel_rotator_4bit(data_in,rotate_amt,dir,data_out);
	input [3:0] data_in;
	input [1:0] rotate_amt;   // 0–3
	input dir;          // 0 = left, 1 = right
	output reg [3:0] data_out;

	always @(*) 
		begin
			if (dir == 1'b0) 
				begin
					// -------- LEFT ROTATE --------
					case (rotate_amt)
						2'd0: data_out = data_in;
						2'd1: data_out = {data_in[2:0], data_in[3]};
						2'd2: data_out = {data_in[1:0], data_in[3:2]};
						2'd3: data_out = {data_in[0],   data_in[3:1]};
						default: data_out = data_in;
					endcase
				end 
			else 
				begin
					// -------- RIGHT ROTATE --------
					case (rotate_amt)
						2'd0: data_out = data_in;
						2'd1: data_out = {data_in[0],   data_in[3:1]};
						2'd2: data_out = {data_in[1:0], data_in[3:2]};
						2'd3: data_out = {data_in[2:0], data_in[3]};
						default: data_out = data_in;
					endcase
				end
		end

endmodule
