module one_hot_fsm_tb;
	reg clk,reset;
	reg start,done;
	wire [3:0] state;

	 one_hot_fsm ohfsm(clk,reset,start,done,state);
    
	initial
		begin
			clk = 1'b0;
			forever #5 clk = !clk;
		end
    
	initial
		begin
			reset = 0;
			start = 0; 
			done = 0;
			#10; 
			reset = 1;
			#10;
			reset = 0;
			#10;
			start = 1;
			#20;
			start = 0;
			#10;
			done = 1;
			#10;
			done = 0;
			$finish;
		end
	
	initial
		$monitor("Time = %0t | Reset = %b | Start = %b | Done = %b | State = %b",$time,reset,start,done,state);
		
	initial
		begin
			$dumpfile("dump.vcd");
			$dumpvars;
		end

endmodule