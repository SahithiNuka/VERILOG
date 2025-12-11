module nor_flash_tb;

    reg clk, rst_n;
    reg [1:0] cmd;
    reg [7:0] din;
    reg [15:0] addr;
    reg wr_en;

    wire [7:0] dout;
    wire busy;

    nor_flash DUT(
        .clk(clk),
        .rst_n(rst_n),
        .cmd(cmd),
        .din(din),
        .addr(addr),
        .wr_en(wr_en),
        .dout(dout),
        .busy(busy)
    );

	initial
		begin
			clk = 1'b0;
			forever #5 clk = ~clk;
		end

    task reset_flash;
		begin
			$display(">>> RESET FLASH");
			rst_n = 0; cmd = 0; wr_en = 0; addr = 0;
			#20;
			rst_n = 1;
			#20;
		end
    endtask

    task erase_sector(input [15:0] ad);
		begin
			$display(">>> ERASE SECTOR (addr=%0d)", ad);
			addr = ad;
			cmd  = 2'b01;
			#20;
			cmd  = 0;
			$display("Erase Done.\n");
		end
    endtask

    task write_byte(input [15:0] ad, input [7:0] val);
		begin
			$display(">>> WRITE BYTE addr=%0d, data=%02h", ad, val);
			addr = ad;
			din  = val;
			cmd  = 2'b10;
			wr_en = 1;
			#10;
			wr_en = 0;
			cmd = 0;
			$display("Write Done.\n");
		end
    endtask

    task read_byte(input [15:0] ad);
		begin
			$display(">>> READ BYTE addr=%0d", ad);
			addr = ad;
			cmd = 2'b11;
			#10;
			$display("READ = %02h\n", dout);
			cmd = 0;
		end
    endtask

    initial 
		begin
			clk = 0;
			reset_flash();
			erase_sector(0);
			write_byte(5, 8'hAA);
			write_byte(6, 8'h55);
			read_byte(5);
			read_byte(6);
			#20;
			$finish;
		end
	initial
		begin
			$dumpfile("dump.vcd");
			$dumpvars;
		end
endmodule
