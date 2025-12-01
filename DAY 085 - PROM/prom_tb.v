module prom_tb;

    reg prog_en;
    reg [3:0] prog_addr;
    reg [7:0] prog_data;

    reg [3:0] addr;
    wire [7:0] data;

    prom(prog_en, prog_addr, prog_data, addr, data);

    initial begin
        // Initial values
        prog_en   = 0;
        prog_addr = 0;
        prog_data = 0;
        addr      = 0;

        // --------------------------
        // PROGRAM PHASE
        // --------------------------
        #10;
        prog_addr = 4'h3;  
        prog_data = 8'hA5;  
        prog_en   = 1;     // Program pulse
        #5 prog_en = 0;

        #10;
        prog_addr = 4'h7;
        prog_data = 8'h5A;
        prog_en   = 1;
        #5 prog_en = 0;

        // --------------------------
        addr = 4'h3;  #10;  // Expect A5
        addr = 4'h7;  #10;  // Expect 5A
        addr = 4'h2;  #10;  // Unprogrammed -> X or default 0

        #20;
        $finish;
    end

    initial 
        $monitor("Time=%0t  Addr=%h  Data=%h", $time, addr, data);
		
	initial
		begin
			$dumpfile("dump.vcd");
			$dumpvars;
		end
endmodule
