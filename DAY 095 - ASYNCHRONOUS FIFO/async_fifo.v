module async_fifo #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 4
)(
    input wr_clk,
    input rd_clk,
    input rst,

    input wr_en,
    input rd_en,
    input [DATA_WIDTH-1:0] din,

    output reg  [DATA_WIDTH-1:0] dout,
    output full,
    output empty
);

    localparam DEPTH = (1 << ADDR_WIDTH);

    reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];

    // Pointers (Binary and Gray)
    reg [ADDR_WIDTH:0] wr_ptr_bin, wr_ptr_gray;
    reg [ADDR_WIDTH:0] rd_ptr_bin, rd_ptr_gray;

    // Pointer sync registers
    reg [ADDR_WIDTH:0] wr_ptr_gray_rsync1, wr_ptr_gray_rsync2;
    reg [ADDR_WIDTH:0] rd_ptr_gray_wsync1, rd_ptr_gray_wsync2;

    // Gray/Binary Conversion
    function [ADDR_WIDTH:0] bin2gray;
        input [ADDR_WIDTH:0] b;
        bin2gray = (b >> 1) ^ b;
    endfunction

    function [ADDR_WIDTH:0] gray2bin;
        input [ADDR_WIDTH:0] g;
        integer i;
			begin
				gray2bin[ADDR_WIDTH] = g[ADDR_WIDTH];
				for (i = ADDR_WIDTH-1; i >= 0; i = i - 1)
					gray2bin[i] = gray2bin[i+1] ^ g[i];
			end
    endfunction

    // WRITE POINTER + MEMORY WRITE
    always @(posedge wr_clk or posedge rst) 
		begin
			if (rst) 
				begin
					wr_ptr_bin  <= 0;
					wr_ptr_gray <= 0;
				end 
			else if (wr_en && !full) 
				begin
					mem[wr_ptr_bin[ADDR_WIDTH-1:0]] <= din;
					wr_ptr_bin  <= wr_ptr_bin + 1;
					wr_ptr_gray <= bin2gray(wr_ptr_bin + 1);
				end
		end

    // ---------------------------------------------------------
    // READ POINTER + MEMORY READ
    // ---------------------------------------------------------
    always @(posedge rd_clk or posedge rst) 
		begin
			if (rst) 
				begin
					rd_ptr_bin  <= 0;
					rd_ptr_gray <= 0;
					dout <= 0;
				end 
			else if (rd_en && !empty) 
				begin
					dout <= mem[rd_ptr_bin[ADDR_WIDTH-1:0]];
					rd_ptr_bin  <= rd_ptr_bin + 1;
					rd_ptr_gray <= bin2gray(rd_ptr_bin + 1);
				end
		end

    // SYNC WRITE → READ DOMAIN
    always @(posedge rd_clk or posedge rst)
		begin
			if (rst) 
				begin
					wr_ptr_gray_rsync1 <= 0;
					wr_ptr_gray_rsync2 <= 0;
				end 
			else 
				begin
					wr_ptr_gray_rsync1 <= wr_ptr_gray;
					wr_ptr_gray_rsync2 <= wr_ptr_gray_rsync1;
				end
		end

    // SYNC READ → WRITE DOMAIN
    always @(posedge wr_clk or posedge rst) begin
        if (rst) begin
            rd_ptr_gray_wsync1 <= 0;
            rd_ptr_gray_wsync2 <= 0;
        end else begin
            rd_ptr_gray_wsync1 <= rd_ptr_gray;
            rd_ptr_gray_wsync2 <= rd_ptr_gray_wsync1;
        end
    end

    // EMPTY
    assign empty = (rd_ptr_gray == wr_ptr_gray_rsync2);

    // FULL (Classic Gray-pointer async full detection)
    assign full =
        ( wr_ptr_gray[ADDR_WIDTH]   != rd_ptr_gray_wsync2[ADDR_WIDTH] ) &&
        ( wr_ptr_gray[ADDR_WIDTH-1] != rd_ptr_gray_wsync2[ADDR_WIDTH-1] ) &&
        ( wr_ptr_gray[ADDR_WIDTH-2:0] == rd_ptr_gray_wsync2[ADDR_WIDTH-2:0] );

endmodule
