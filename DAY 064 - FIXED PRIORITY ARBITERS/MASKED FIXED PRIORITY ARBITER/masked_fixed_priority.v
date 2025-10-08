
module masked_fixed_priority (req,mask,grant);
    input  [3:0] req;
    input  [3:0] mask;
    output [3:0] grant;

    wire [3:0] eff_req = req & mask;

    assign grant[0] = eff_req[0];
    assign grant[1] = eff_req[1] & ~eff_req[0];
    assign grant[2] = eff_req[2] & ~eff_req[1] & ~eff_req[0];
    assign grant[3] = eff_req[3] & ~eff_req[2] & ~eff_req[1] & ~eff_req[0];
endmodule
