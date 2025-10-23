
module elevator_tb();
	reg clk,rst;
	reg [1:0]req_floor; //requested floor 0-3
	wire [1:0]current_floor;
	wire moving_up, moving_down, door_open;
	
	elevator dut(clk,rst,req_floor,current_floor,moving_up,moving_down,door_open);
	
	initial
		begin
			clk = 1'b0;
			forever #5 clk = !clk;
		end
		
	initial
		begin
			rst = 1'b1;
			req_floor = 2'b00;
			#10;
			rst = 1'b0;
			
			req_floor = 2'b11;
			#50;
			
			req_floor = 2'b01;
			#50;
			
			req_floor = current_floor;
			#50;
          
          	req_floor = 2'b10;
          	#50;
          	$finish;
		end
		
		initial
			begin
				$display("Time\tFloor\tUp\tDown\tDoor");
				$monitor("%0t\t%0d\t%b\t%b\t%b",$time, current_floor, moving_up, moving_down, door_open);
			end

endmodule