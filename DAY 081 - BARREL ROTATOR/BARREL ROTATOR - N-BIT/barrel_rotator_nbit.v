module barrel_rotator_nbit #(
    parameter N = 8
)(
    input  [N-1:0] data_in,
    input  [$clog2(N)-1:0] rotate_amt,
    input        dir,            // 0 = left, 1 = right
    output [N-1:0] data_out
);

    wire [N-1:0] left_rot;
    wire [N-1:0] right_rot;

    // LEFT rotate: (A << k) OR (A >> (N - k))
    assign left_rot  = (data_in << rotate_amt) |
                       (data_in >> (N - rotate_amt));

    // RIGHT rotate: (A >> k) OR (A << (N - k))
    assign right_rot = (data_in >> rotate_amt) |
                       (data_in << (N - rotate_amt));

    assign data_out = dir ? right_rot : left_rot;

endmodule
