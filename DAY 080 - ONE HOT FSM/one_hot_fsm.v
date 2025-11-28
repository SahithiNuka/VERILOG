module one_hot_fsm(clk,reset,start,done,state);

    input clk,reset;
	input start,done;   
    output reg [3:0] state;

    parameter IDLE = 4'b0001,LOAD = 4'b0010,PROCESS = 4'b0100,DONE = 4'b1000;
              
    reg [3:0] next;
	
    always @(posedge clk or posedge reset)
	begin
        if (reset)
            state <= IDLE; 
        else
            state <= next;
    end
    
    always @(*)
	begin
        case (state)
            IDLE: 
                if (start)
					next = LOAD;
                else 
					next = IDLE;

            LOAD: 
                next = PROCESS;

            PROCESS: 
                if (done)
					next = DONE;
                else 
					next = PROCESS;

            DONE: 
                next = IDLE;

            default: 
                next = IDLE;
        endcase
    end
	
endmodule