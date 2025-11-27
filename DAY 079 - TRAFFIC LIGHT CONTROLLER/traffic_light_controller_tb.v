module traffic_light_controller_tb;

    reg clk, reset;
    wire red, yellow, green;

    
    traffic_light_controller tlc (
        .clk(clk),
        .reset(reset),
        .red(red),
        .yellow(yellow),
        .green(green)
    );

    initial
		begin
			clk = 1'b0;
			forever #5 clk = !clk;
		end

    initial 
		begin
			reset = 1;
			#10;
			reset = 0;
			#500;
			$finish;
		end

    initial
        $monitor("Time=%0t | RED=%b YELLOW=%b GREEN=%b",$time, red, yellow, green);

endmodule
