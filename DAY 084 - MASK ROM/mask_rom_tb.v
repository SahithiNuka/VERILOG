
module mask_rom_tb;

    reg  [3:0] addr;
    wire [7:0] data;

    mask_rom(addr,data);

    initial
		begin
        addr = 4'h0; #10;
        addr = 4'h1; #10;
        addr = 4'h2; #10;
        addr = 4'h3; #10;
        addr = 4'h4; #10;
        addr = 4'h5; #10;
        addr = 4'h6; #10;
        addr = 4'h7; #10;
        addr = 4'h8; #10;
        addr = 4'h9; #10;
        addr = 4'hA; #10;
        addr = 4'hB; #10;
        addr = 4'hC; #10;
        addr = 4'hD; #10;
        addr = 4'hE; #10;
        addr = 4'hF; #10;

        $finish;
    end

	initial
		$monitor("%0t\t%h\t%h", $time, addr, data);
		
	initial
		begin
			$dumpfile("dump.vcd");
			$dumpvars;
		end
endmodule

