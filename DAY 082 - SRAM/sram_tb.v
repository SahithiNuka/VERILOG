module sram_tb();
	reg clk,we;
	reg [3:0] addr;
	reg [15:0] wdata;
	wire [15:0] rdata;

    sram(clk,we,addr,wdata,rdata);
	
	 integer i;

    initial 
		begin
			clk = 0;
			forever #5 clk = ~clk;
		end
   

    initial 
		begin
			we = 0;
			addr = 0;
			wdata = 0;

        // 1. Basic Write Operations
 
        #10; we = 1; addr = 4'd0; wdata = 16'haaaa;
        #10; addr = 4'd2; wdata = 16'h5678;
        #10; addr = 4'd4; wdata = 16'hb4b3;
        #10; addr = 4'd6; wdata = 16'hcccc;

        // 2. Basic Read Operations
        #10; we = 0; addr = 4'd0;
        #10; addr = 4'd2;
        #10; addr = 4'd4;
        #10; addr = 4'd6;
        #10; addr = 4'd1; // Unwritten address
        #10; addr = 4'd5; // Unwritten address

        // 3. Overwrite Test
        #10; we = 1; addr = 4'd0; wdata = 16'h1234; // Overwrite address 0
        #10; we = 0; addr = 4'd0;                   // Read updated address 0

        // 4. Write to All 16 Locations
        #10;
        for (i = 0; i < 16; i = i + 1) begin
            we = 1;
            addr = i[3:0];
            wdata = i * 16'h1111;
            #10;
        end

        // Read from all locations
        we = 0;
        for (i = 0; i < 16; i = i + 1) begin
            addr = i[3:0];
            #10;
        end

        // 5. Randomized Write/Read
        repeat (5) begin
            we = 1;
            addr = $random % 16;
            wdata = $random;
            #10;
        end

        repeat (5) begin
            we = 0;
            addr = $random % 16;
            #10;
        end

        // 6. Back-to-back Write then Read
        #10; we = 1; addr = 4'd8; wdata = 16'hdead;
        #10; we = 0; addr = 4'd8;

        #20;
        $stop;
    end
	initial
		$monitor("time=%t, we=%b,addr=%d,wdata=%h,rdata=%h",$time,we,addr,wdata,rdata);
		
	initial
		begin
			$dumpfile("dump.vcd");
			$dumpvars;
		end
endmodule