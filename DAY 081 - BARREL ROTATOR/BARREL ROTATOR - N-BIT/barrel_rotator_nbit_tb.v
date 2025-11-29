module barrel_rotator_nbit_tb;

    parameter N = 8;

    reg  [N-1:0] data_in;
    reg  [$clog2(N)-1:0] rotate_amt;
    reg          dir;
    wire [N-1:0] data_out;

    barrel_rotator_nbit #(.N(N)) DUT (
        .data_in(data_in),
        .rotate_amt(rotate_amt),
        .dir(dir),
        .data_out(data_out)
    );

    initial begin
        $monitor("t=%0t | in=%b | amt=%0d | dir=%s | out=%b",
                 $time, data_in, rotate_amt,
                 (dir ? "RIGHT" : "LEFT"), data_out);

        data_in = 8'b11010110;

        dir = 0;
        rotate_amt = 0; #10;
        rotate_amt = 1; #10;
        rotate_amt = 2; #10;
        rotate_amt = 3; #10;
        rotate_amt = 4; #10;
        rotate_amt = 5; #10;
        rotate_amt = 6; #10;
        rotate_amt = 7; #10;

        dir = 1;
        rotate_amt = 0; #10;
        rotate_amt = 1; #10;
        rotate_amt = 2; #10;
        rotate_amt = 3; #10;
        rotate_amt = 4; #10;
        rotate_amt = 5; #10;
        rotate_amt = 6; #10;
        rotate_amt = 7; #10;

        $finish;
    end

endmodule
