
// Simple Burst SRAM (4-bit addr, 8-bit data)
// One word transferred per clock

module burst_sram(clk,rst,start,we,addr,burst_len,data_in,data_out,ready);
    input  wire clk;
    input  wire rst;
    input  wire start; // Start burst
    input  wire we; // 1=write, 0=read
    input  wire [3:0]  addr; // Start address
    input  wire [3:0]  burst_len; // Number of words
    input  wire [7:0]  data_in; // Write data
    output reg  [7:0]  data_out; // Read data
    output reg ready; // High when done


    reg [7:0] mem [15:0]; // 16x8 SRAM
    reg [3:0] curr_addr; // Current address
    reg [3:0] count; // Burst counter
    reg busy; // Burst in progress


    always @(posedge clk or posedge rst) 
		begin
			if (rst) 
				begin
					curr_addr <= 0;
					count <= 0;
					busy <= 0;
					ready <= 0;
					data_out <= 0;
				end
			else 
				begin
					// Start burst
					if (start && !busy) 
						begin
							busy <= 1;
							ready <= 0;
							curr_addr <= addr;
							count <= 0;
						end

					// During burst
					if (busy) 
						begin
							if (we)
								mem[curr_addr] <= data_in; // Write operation
							else
								data_out <= mem[curr_addr]; // Read operation

							curr_addr <= curr_addr + 1'b1;
							count <= count + 1'b1;

							// End of burst
							if (count == burst_len - 1) 
								begin
									busy  <= 0;
									ready <= 1; // Signal completion
								end
						end
					else 
						begin
							ready <= 0;
						end
				end
		end

endmodule
