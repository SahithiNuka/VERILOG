module barrel_rotator_4bit_tb;
    reg [3:0] data_in;
    reg [1:0] rotate_amt;
    reg dir;
    wire [3:0] data_out;

    barrel_rotator_4bit br(data_in,rotate_amt,dir,data_out);

    initial 
		begin
			data_in = 4'b1101;
			// ---------- LEFT ROTATE ----------
			dir = 0;
			rotate_amt = 2'd0; #10;
			rotate_amt = 2'd1; #10;
			rotate_amt = 2'd2; #10;
			rotate_amt = 2'd3; #10;
			
			// ---------- RIGHT ROTATE ----------
			dir = 1;
			rotate_amt = 2'd0; #10;
			rotate_amt = 2'd1; #10;
			rotate_amt = 2'd2; #10;
			rotate_amt = 2'd3; #10;
			$finish;
		end
	initial
		$monitor("Time=%0t | data_in=%b | amt=%0d | dir=%s | data_out=%b",$time, data_in, rotate_amt,(dir ? "RIGHT" : "LEFT"), data_out);

endmodule
