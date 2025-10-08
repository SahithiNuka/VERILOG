module programmable_fixed_priority (req,priority_order,grant);
    input  [3:0] req;
    input  [7:0] priority_order; // 2 bits per channel
    output reg [3:0] grant;
    integer i, j;
    reg [1:0] priority_level [3:0]; // 4 entries, each with 2-bit level

    always @(*) begin : search
        // Unpack priorities from input bus
        priority_level[0] = priority_order[1:0];
        priority_level[1] = priority_order[3:2];
        priority_level[2] = priority_order[5:4];
        priority_level[3] = priority_order[7:6];

        grant = 4'b0000;

        // Search for the highest-priority active request
        for (i = 0; i < 4; i = i + 1) begin
            for (j = 0; j < 4; j = j + 1) begin
                if (priority_level[j] == i[1:0] && req[j]) begin
                    grant[j] = 1'b1;
                    disable search; // Stop after granting one
                end
            end
        end
    end
endmodule
