module dram_tb();
    reg clk,rst_n,we_a,we_b,read_en_a, read_en_b,refresh_en;
    reg [3:0] addr_a, addr_b;
    reg [15:0] data_in_a, data_in_b;
    wire [15:0] data_out_a, data_out_b;

    dram mem(clk,rst_n,we_a,we_b,read_en_a,read_en_b,refresh_en,addr_a,addr_b,data_in_a,data_in_b,data_out_a,data_out_b);

    initial 
		begin
			clk = 0;
			forever #5 clk = ~clk;
		end

    initial 
		begin
			rst_n = 0;
			we_a = 0; we_b = 0;
			read_en_a = 0; read_en_b = 0;
			refresh_en = 0;
			addr_a = 0; addr_b = 0;
			data_in_a = 0; data_in_b = 0;
			#15; 
			rst_n = 1;

			// Corner case 1: Write to lowest and highest address simultaneously
			we_a = 1; addr_a = 0; data_in_a = 16'hAAAA;
			we_b = 1; addr_b = 15; data_in_b = 16'h5555;
			#10;
			we_a = 0; we_b = 0;

			// Corner case 2: Read immediately after write
			read_en_a = 1; addr_a = 0;
			read_en_b = 1; addr_b = 15;
			#10;
			read_en_a = 0; read_en_b = 0;

			// Corner case 3: Enable both ports to the same address
			we_a = 1; we_b = 1; addr_a = 5; addr_b = 5;
			data_in_a = 16'h1111; data_in_b = 16'h2222;
			#10;
			we_a = 0; we_b = 0;

			// Read back to see which data was retained
			read_en_a = 1; addr_a = 5;
			read_en_b = 1; addr_b = 5;
			#10;
			read_en_a = 0; read_en_b = 0;

			// Corner case 4: Refresh operation
			refresh_en = 1;
			#10 
			refresh_en = 0;

			// Corner case 5: Write and read to same location in one cycle
			we_a = 1; addr_a = 3; data_in_a = 16'hFACE;
			read_en_a = 1; addr_a = 3;
			#10;
			we_a = 0; read_en_a = 0;

			// Corner case 6: Read from uninitialized location
			read_en_b = 1; addr_b = 7;
			#10;
			read_en_b = 0;

			// Corner case 7: Simultaneous refresh and write (should prioritize refresh or handle safely)
			refresh_en = 1;
			we_b = 1; addr_b = 9; data_in_b = 16'hBEEF;
			#10;
			refresh_en = 0; we_b = 0;

			// Final read to check values
			read_en_a = 1; addr_a = 3;
			read_en_b = 1; addr_b = 9;
			#10;
			read_en_a = 0; read_en_b = 0;
			#50;

        $finish;
    end

    initial
        $monitor("Time=%0t | A: we_a=%b addr_a=%d in=%h out=%h | B: we_b=%b addr_b=%d in=%h out=%h | refresh=%b", $time, we_a, addr_a, data_in_a, data_out_a, we_b, addr_b, data_in_b, data_out_b, refresh_en);

	initial
		begin
			$dumpfile("dump.vcd");
			$dumpvars;
		end
endmodule