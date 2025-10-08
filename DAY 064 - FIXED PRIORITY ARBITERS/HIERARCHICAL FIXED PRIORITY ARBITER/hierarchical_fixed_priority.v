module local_arbiter (req,grant,valid);
    input  [1:0] req;
    output [1:0] grant;
    output valid;
	
    assign grant[0] = req[0];
    assign grant[1] = req[1] & ~req[0];
    assign valid = |req;
endmodule

module hierarchical_fixed_priority (req,grant);
    input  [3:0] req;
    output [3:0] grant;
	
    wire [1:0] grantA, grantB;
    wire validA, validB;
    wire [1:0] group_sel;

    local_arbiter A (req[1:0],grantA,validA);
 	local_arbiter B (req[3:2],grantB,validB);

    assign group_sel[0] = validA; // Group A higher priority
    assign group_sel[1] = validB & ~validA;

    assign grant = { (group_sel[1] ? grantB : 2'b00),
                     (group_sel[0] ? grantA : 2'b00) };
endmodule
