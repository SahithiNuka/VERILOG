module traffic_light_controller #(
    parameter RED_TIME    = 5,
    parameter GREEN_TIME  = 5,
    parameter YELLOW_TIME = 2)(clk,reset,red,yellow,green);
	
    input  wire clk;
    input  wire reset;
    output reg red;
    output reg yellow;
    output reg green;

    // State Encoding 
    parameter S_RED    = 2'b00,
				S_GREEN  = 2'b01,
				S_YELLOW = 2'b10;

	reg [1:0] ps, ns;
	reg [3:0] timer;

    // Sequential logic (state + timer update)
    always @(posedge clk or posedge reset)
		begin
			if (reset)
				begin
					ps <= S_RED;
					timer <= 0;
				end
			else 
				begin
					ps <= ns;
					if (ps != ns)
						timer <= 0;
					else
					timer <= timer + 1;
				end
		end

    // Next-state logic
    always @(*) 
		begin
			case (ps)
				S_RED: begin
					if (timer >= RED_TIME)
						ns = S_GREEN;
					else
						ns = S_RED;
				end

				S_GREEN: begin
					if (timer >= GREEN_TIME)
						ns = S_YELLOW;
					else
						ns = S_GREEN;
				end

				S_YELLOW: begin
					if (timer >= YELLOW_TIME)
						ns = S_RED;
					else
						ns = S_YELLOW;
				end

				default: ns = S_RED;
			endcase
		end

    // Output logic
    always @(*)
		begin
			red    = (ps == S_RED);
			green  = (ps == S_GREEN);
			yellow = (ps == S_YELLOW);
		end

endmodule
