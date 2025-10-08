
module static_fixed_priority (req, grant);

    input  [3:0] req; //Requests: R0 highest, R3 lowest
    output [3:0] grant; // One-hot grant output
	
    assign grant[0] = req[0];
    assign grant[1] = req[1] & ~req[0];
    assign grant[2] = req[2] & ~req[1] & ~req[0];
    assign grant[3] = req[3] & ~req[2] & ~req[1] & ~req[0];
	
endmodule
