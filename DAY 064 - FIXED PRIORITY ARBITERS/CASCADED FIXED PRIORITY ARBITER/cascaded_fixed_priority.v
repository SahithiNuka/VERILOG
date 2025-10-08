// Basic 4-input fixed priority block
module fixed_priority_4 (req,grant,any_grant);
    input  [3:0] req;
    output [3:0] grant;
    output       any_grant;
	
    assign grant[0] = req[0];
    assign grant[1] = req[1] & ~req[0];
    assign grant[2] = req[2] & ~req[1] & ~req[0];
    assign grant[3] = req[3] & ~req[2] & ~req[1] & ~req[0];
    assign any_grant = |grant;
endmodule

// Cascaded arbiter for 8 requests (2 blocks of 4)
module cascaded_fixed_priority (req,grant);
    input  [7:0] req;
    output [7:0] grant;
	
    wire [3:0] g0, g1;
    wire valid0, valid1;

    fixed_priority_4 A (req[3:0],g0,valid0);
	fixed_priority_4 B (req[7:4],g1,valid1);

    assign grant[3:0] = valid0 ? g0 : 4'b0000;
    assign grant[7:4] = (~valid0) ? g1 : 4'b0000;
endmodule
