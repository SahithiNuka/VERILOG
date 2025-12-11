module nand_flash #(
    parameter BLOCKS = 4,
    parameter PAGES  = 4,
    parameter PAGE_SIZE = 16 // bytes per page
)(
    input clk,
    input rst_n, // active-low reset
    input [1:0]cmd, // 00=IDLE,01=ERASE,10=PROGRAM,11=READ
    input [7:0]din,
    input [7:0]blk,
    input [7:0]page,
    input wr_en, // pulse to write one byte (with din ready)

    output reg [7:0]dout,
    output reg busy
);

    // memory: block,page,byte
    reg [7:0] mem [0:BLOCKS-1][0:PAGES-1][0:PAGE_SIZE-1];

    // separate pointers for program/read
    reg [$clog2(PAGE_SIZE)-1:0] wr_ptr;
    reg [$clog2(PAGE_SIZE)-1:0] rd_ptr;

    integer b,p,i;

    always @(posedge clk) 
		begin
			if (!rst_n) 
				begin
					// initialize memory to 0xFF and pointers
					for (b = 0; b < BLOCKS; b = b + 1)
						for (p = 0; p < PAGES; p = p + 1)
							for (i = 0; i < PAGE_SIZE; i = i + 1)
								mem[b][p][i] <= 8'hFF;
					busy <= 1'b0;
					dout <= 8'h00;
					wr_ptr <= 0;
					rd_ptr <= 0;
				end 
			else 
				begin
					case (cmd)
						2'b01: begin // ERASE (erase whole block -> fill page with 0xFF)
							busy <= 1'b1;
							for (i = 0; i < PAGE_SIZE; i = i + 1)
								mem[blk][page][i] <= 8'hFF;
							// reset pointers for that page
							wr_ptr <= 0;
							rd_ptr <= 0;
							busy <= 1'b0;
						end

						2'b10: begin // PROGRAM (write bytes while wr_en asserted)
							busy <= 1'b1;
							if (wr_en) 
								begin
									if (wr_ptr < PAGE_SIZE)
										mem[blk][page][wr_ptr] <= din;
									wr_ptr <= wr_ptr + 1;
								end
							busy <= 1'b0;
						end

						2'b11: begin // READ (read sequentially)
							busy <= 1'b1;
							if (rd_ptr < PAGE_SIZE)
								dout <= mem[blk][page][rd_ptr];
							else
								dout <= 8'hxx;
							rd_ptr <= rd_ptr + 1;
							busy <= 1'b0;
						end

						default: begin
							busy <= 1'b0;
						end
					endcase
			end
		end

endmodule
