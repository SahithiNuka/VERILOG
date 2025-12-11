module nand_flash_tb;
    parameter PAGE_BYTES = 4;

    reg clk;
    reg rst_n;
    reg [1:0] cmd;
    reg [7:0] din, blk, page;
    reg wr_en;
    wire [7:0] dout;
    wire busy;

    nand_flash #(.PAGE_SIZE(16)) dut (
        .clk(clk), .rst_n(rst_n), .cmd(cmd),
        .din(din), .blk(blk), .page(page), .wr_en(wr_en),
        .dout(dout), .busy(busy)
    );

    // simple clock
    initial 
		begin
			clk = 0;
			forever #5 clk = ~clk;
		end
				
    task reset_flash;
		begin
			$display(">>> RESET FLASH");
			rst_n = 0; cmd = 0; wr_en = 0; din = 0; blk = 0; page = 0;
			#20;
			rst_n = 1;
			#20;
		end
    endtask

    task erase_block(input [7:0] b, input [7:0] p);
		begin
			$display(">>> ERASE BLOCK %0d PAGE %0d", b, p);
			blk = b; page = p;
			cmd = 2'b01;
			#10; // let one cycle perform erase
			cmd = 2'b00;
			#10;
			$display("Erase Done.\n");
		end
    endtask

    task program_page(input [7:0] b, input [7:0] p);
		integer i;
		begin
			$display(">>> PROGRAM BLOCK %0d PAGE %0d", b, p);
			blk = b; page = p;
			cmd = 2'b10;
			// pulse wr_en with data on each rising edge
			for (i = 0; i < PAGE_BYTES; i = i + 1) 
				begin
					@(negedge clk);
					din = i * 8'h11; // 00,11,22,33,...
					wr_en = 1;
					@(negedge clk);
					wr_en = 0;
					#1;
				end
			cmd = 2'b00;
			#10;
			$display("Program Done.\n");
		end
    endtask

    task read_page(input [7:0] b, input [7:0] p);
		integer i;
		begin
			$display(">>> READ BLOCK %0d PAGE %0d", b, p);
			blk = b; page = p;
			cmd = 2'b11;
			for (i = 0; i < PAGE_BYTES; i = i + 1)
				begin
					@(negedge clk);
					#1;
					$display("READ[%0d] = %02h", i, dout);
				end
			cmd = 2'b00;
			#10;
    end
    endtask

    initial 
		begin
			reset_flash();
			erase_block(0,0);
			program_page(0,0);
			read_page(0,0);
			#10;
			$finish;
		end
		
	initial
		begin
			$dumpfile("dump.vcd");
			$dumpvars;
		end

endmodule
