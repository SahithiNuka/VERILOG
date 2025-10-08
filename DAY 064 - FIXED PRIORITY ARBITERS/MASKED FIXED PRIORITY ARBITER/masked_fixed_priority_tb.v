
module masked_fixed_priority_tb;
    reg  [3:0] req;
    reg  [3:0] mask;
    wire [3:0] grant;

    masked_fixed_priority DUT (req,mask,grant);

    initial begin
        $display("Time\tMask\tReq\tGrant");
        $monitor("%0t\t%b\t%b\t%b", $time, mask, req, grant);

        mask = 4'b1111;
        req  = 4'b0000; #10;
        req  = 4'b1011; #10; // All active -> G0
        mask = 4'b0111; #10; // Disable R3
        req  = 4'b1111; #10; // R3 masked -> G0
        mask = 4'b0011; #10; // Only R0, R1 enabled
        req  = 4'b1111; #10;
        mask = 4'b1000; #10; // Only R3 allowed
        req  = 4'b1111; #10;
        $finish;
    end
endmodule
