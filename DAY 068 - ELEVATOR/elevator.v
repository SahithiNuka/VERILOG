module elevator(clk,rst,req_floor,current_floor,moving_up,moving_down,door_open);
	input clk,rst;
	input [1:0]req_floor; //requested floor 0-3
	output reg [1:0]current_floor;
	output reg moving_up, moving_down, door_open;
	
	parameter IDLE = 2'b00,
			  MOVE_UP = 2'b01,
			  MOVE_DOWN = 2'b10,
			  OPEN_DOOR = 2'b11;
			  
	reg [1:0]p_state, n_state; //present state and next state
	
	always@(posedge clk or posedge rst)
		begin
			if(rst)
				p_state <= IDLE;
			else
				p_state <= n_state;
		end
		
	//next state and output logic
	always@(*)
		begin
			moving_up = 1'b0;
			moving_down = 1'b0;
			door_open = 1'b0;
			n_state = p_state;
			
			case(p_state)
				IDLE:
					begin
						if(req_floor > current_floor)
							n_state = MOVE_UP;
						else if(req_floor < current_floor)
							n_state = MOVE_DOWN;
						else
							n_state = OPEN_DOOR;
					end
					
				MOVE_UP:
					begin
						moving_up = 1'b1;
						if(current_floor == req_floor)
							n_state = OPEN_DOOR;
						else
							n_state = MOVE_UP;
					end
				MOVE_DOWN:
					begin
						moving_down = 1'b1;
						if(current_floor == req_floor)
							n_state = OPEN_DOOR;
						else
							n_state = MOVE_DOWN;
					end
				OPEN_DOOR:
					begin
						door_open = 1'b1;
						n_state = IDLE;
					end
			endcase
		end
		
	//floor update logic
	always@(posedge clk or posedge rst)
		begin
			if(rst)
				current_floor <= 2'b0;
			else
				begin
					case(p_state)
						MOVE_UP:
							begin
								if(current_floor < 2'b11)
									current_floor <= current_floor + 1'b1;
							end
						MOVE_DOWN:
							begin
								if(current_floor > 2'b0)
									current_floor <= current_floor - 1'b1;
							end
						default:
							current_floor <= current_floor;
					endcase
				end
		end
endmodule