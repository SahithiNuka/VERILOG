
module cascaded_fixed_priority_tb;
    reg  [7:0] req;
    wire [7:0] grant;

    cascaded_fixed_priority DUT (req,grant);

    initial begin
        $display("Time\tReq\t\tGrant");
        $monitor("%0t\t%b\t%b", $time, req, grant);

        req = 8'b0000_0000; #10;
        req = 8'b0000_0100; #10; // Lower 4 active
        req = 8'b0010_0000; #10; // Upper group active
        req = 8'b1111_0000; #10; // All upper active
        req = 8'b0000_1111; #10; // Lower group active
        req = 8'b1111_1111; #10; // Both groups active -> Lower group wins
        req = 8'b0100_0000; #10;
        $finish;
    end
endmodule
