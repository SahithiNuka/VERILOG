module async_fifo_tb;

    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 4;

    reg wr_clk, rd_clk, rst;
    reg wr_en, rd_en;
    reg  [DATA_WIDTH-1:0] din;
    wire [DATA_WIDTH-1:0] dout;
    wire full, empty;

    async_fifo #(DATA_WIDTH, ADDR_WIDTH) DUT (
        .wr_clk(wr_clk),
        .rd_clk(rd_clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .din(din),
        .dout(dout),
        .full(full),
        .empty(empty)
    );

    initial begin
        wr_clk = 0;
        forever #5 wr_clk = ~wr_clk;   
    end

    initial begin
        rd_clk = 0;
        forever #7 rd_clk = ~rd_clk;  
    end

    initial begin
        wr_en = 0;
        rd_en = 0;
        din = 0;
        rst = 1;
        #20 rst = 0;
		
        // CASE 1 : WRITE A5, READ A5
        @(posedge wr_clk);
        wr_en = 1; din = 8'hA5;

        @(posedge wr_clk);
        wr_en = 0;

        @(posedge rd_clk);
        @(posedge rd_clk);

        @(posedge rd_clk);
        rd_en = 1;

        @(posedge rd_clk);
        rd_en = 0;

        // CASE 2 : FILL FIFO COMPLETELY (CHECK FULL FLAG)
        repeat ((1<<ADDR_WIDTH)) 
			begin
				@(posedge wr_clk);
				if (!full)
					begin
						wr_en = 1;
						din = $random % 256;
						$display("WRITE: %0d", din);
					end
			end
        wr_en = 0;

        // CASE 3 : EMPTY FIFO COMPLETELY (CHECK EMPTY FLAG)
        repeat ((1<<ADDR_WIDTH) + 2) 
			begin
				@(posedge rd_clk);
				if (!empty) 
					begin
						rd_en = 1;
						$display("READ : %0d", dout);
					end 
				else 
					begin
						rd_en = 0;
					end
			end

        // CASE 4 : WRITE & READ SIMULTANEOUSLY
        fork
            // WRITE SIDE
            begin
                repeat (8) 
					begin
						@(posedge wr_clk);
						if (!full) 
							begin
								wr_en = 1;
								din = $random % 256;
								$display("WRITE: %0d", din);
							end
					end
					wr_en = 0;
            end

            // READ SIDE
            begin
                repeat (8) 
					begin
						@(posedge rd_clk);
						if (!empty) 
							begin
								rd_en = 1;
								$display("READ : %0d", dout);
							end
					end
					rd_en = 0;
            end
        join

        // CASE 5 : BURST WRITE THEN BURST READ
        // Burst write 6 items
        repeat (6) 
			begin
				@(posedge wr_clk);
				wr_en = 1;
				din = $random % 256;
				$display("BURST WRITE: %0d", din);
			end
			wr_en = 0;

			@(posedge rd_clk);
			@(posedge rd_clk);  // pointer sync

        // Burst read 6 items
        repeat (6) 
			begin
				@(posedge rd_clk);
				rd_en = 1;
				$display("BURST READ : %0d", dout);
			end
			rd_en = 0;
			#40;
        $finish;
    end
  
  	initial
      	begin
          $dumpfile("dump.vcd");
          $dumpvars;
        end

endmodule
