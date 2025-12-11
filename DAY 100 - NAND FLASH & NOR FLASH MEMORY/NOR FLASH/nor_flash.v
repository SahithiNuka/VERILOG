module nor_flash #(
    parameter SECTORS = 4,
    parameter SECTOR_SIZE = 256  // bytes per sector
)(
    input              clk,
    input              rst_n,
    input      [1:0]   cmd,        // 00=IDLE, 01=ERASE, 10=WRITE, 11=READ
    input      [7:0]   din,
    input      [15:0]  addr,       // full address for NOR read/write
    input              wr_en,

    output reg [7:0]   dout,
    output reg         busy
);

    parameter TOTAL_BYTES = SECTORS * SECTOR_SIZE;

    reg [7:0] mem [0:TOTAL_BYTES-1];

    integer i;

    wire [15:0] sector_start = (addr / SECTOR_SIZE) * SECTOR_SIZE;

    // Reset: set all bytes to FF (NOR default)
    always @(posedge clk) 
		begin
			if (!rst_n) 
				begin
					for (i = 0; i < TOTAL_BYTES; i = i + 1)
						mem[i] <= 8'hFF;
					dout <= 0;
					busy <= 0;
				end

			else 
				begin
					case (cmd)
						// ERASE: Set entire sector to FF
						2'b01: begin
							busy <= 1;
							for (i = 0; i < SECTOR_SIZE; i = i + 1)
								mem[sector_start + i] <= 8'hFF;
							busy <= 0;
						end

						// WRITE: Byte Programming
						// NOR flash can only change 1→0 (not 0→1)
						2'b10: begin
							busy <= 1;
							if (wr_en) 
								begin
									// NOR flash only allows bit-wise AND operation
									mem[addr] <= mem[addr] & din;
								end
							busy <= 0;
						end

						// READ: Random access
						2'b11: begin
							dout <= mem[addr];
							busy <= 0;
						end
						
						default: busy <= 0;
					endcase
				end
		end

endmodule
