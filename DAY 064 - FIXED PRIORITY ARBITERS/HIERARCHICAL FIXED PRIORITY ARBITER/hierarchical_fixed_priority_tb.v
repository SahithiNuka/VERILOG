
module hierarchical_fixed_priority_tb;
    reg  [3:0] req;
    wire [3:0] grant;

    hierarchical_fixed_priority DUT (req,grant);

    initial begin
        $display("Time\tReq\tGrant");
        $monitor("%0t\t%b\t%b", $time, req, grant);

        req = 4'b0000; #10;
        req = 4'b0001; #10; // Local A (Group 0)
      	req = 4'b0010; #10;
      	req = 4'b0011; #10;
      	req = 4'b0100; #10;
      	req = 4'b0101; #10;
        req = 4'b0110; #10; // Local A highest
      	req = 4'b0111; #10;
      	req = 4'b1000; #10;
      	req = 4'b1001; #10;
      	req = 4'b1010; #10;
      	req = 4'b1011; #10;
        req = 4'b1100; #10; // Local B active
      	req = 4'b1101; #10;
      	req = 4'b1110; #10;
        req = 4'b1111; #10; // Both active -> Group A has higher priority
        $finish;
    end
endmodule
