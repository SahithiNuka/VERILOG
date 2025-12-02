module burst_sram_tb;

    reg clk = 0;
    reg rst = 1;
    reg start;
    reg we;
    reg [3:0] addr;
    reg [3:0] burst_len;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire ready;

	burst_sram bsram(clk,rst,start,we,addr,burst_len,data_in,data_out,ready);
	
	initial
		begin
			clk = 1'b0;
			forever #5 clk = !clk;
		end

	task burst_write;
		input [3:0] a;
		input [3:0] len;
		input [7:0] base;
		integer i;
		begin
			data_in = base;
            @(posedge clk);
            we        = 1;
            addr      = a;
            burst_len = len;
            start     = 1;
            @(posedge clk) start = 0;
            for (i = 1; i < len; i = i + 1) 
				begin
					@(posedge clk);
					data_in = base + i;
				end
            wait(ready);
        end
    endtask

    task burst_read;
		input [3:0] a;
		input [3:0] len;
		integer j;
		begin
            @(posedge clk);
            we = 0;
            addr = a;
            burst_len = len;
            start = 1;
            @(posedge clk) start = 0;
            for (j = 0; j < len; j = j + 1) 
				begin
					@(posedge clk);
					$display("READ: addr=%0d data=%h", a + j, data_out);
				end
            wait(ready);
        end
    endtask

    initial 
		begin
        start = 0;
        we = 0;
        addr = 0;
        burst_len = 0;
        data_in = 0;

        #20 rst = 0;

        $display("\nCASE 1: Burst WRITE 4 bytes @2");
        burst_write(4'd2, 4'd4, 8'hA0);

        $display("CASE 2: READ 4 bytes @2");
        burst_read(4'd2, 4'd4);

        $display("\nCASE 3: Burst WRITE 8 bytes @5");
        burst_write(4'd5, 4'd8, 8'hB0);

        $display("CASE 4: READ 8 bytes @5");
        burst_read(4'd5, 4'd8);

        $display("\nCASE 5: BACK-TO-BACK WRITE+READ @10");
        burst_write(4'd10, 4'd4, 8'hC0);
        burst_read (4'd10, 4'd4);

        $display("\nCASE 6: Single word write/read @8");
        burst_write(4'd8, 4'd1, 8'hD5);
        burst_read (4'd8, 4'd1);

        #20
		$finish;
    end
	
	initial
		begin
			$dumpfile("dump.vcd");
			$dumpvars;
		end

endmodule
