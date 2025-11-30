module dram clk,rst_n,we_a,we_b,read_en_a,read_en_b,refresh_en,addr_a,addr_b,data_in_a,data_in_b,data_out_a,data_out_b);
    input wire clk;
    input wire rst_n; // Active-low reset
    input wire we_a;
    input wire we_b;
    input wire read_en_a;
    input wire read_en_b;
    input wire refresh_en;
    input wire [3:0] addr_a;
    input wire [3:0] addr_b;
    input wire [15:0] data_in_a;
    input wire [15:0] data_in_b;
    output reg [15:0] data_out_a;
    output reg [15:0] data_out_b;

    reg [15:0] dram_mem [0:15]; 
    reg [3:0] refresh_counter;
    integer i;

    // Initialize memory
    initial 
		begin
			for (i = 0; i < 16; i = i + 1)
				dram_mem[i] = 16'b0;
			data_out_a = 16'b0;
			data_out_b = 16'b0;
			refresh_counter = 4'b0000;
		end

    always @(posedge clk or negedge rst_n) 
		begin
			if (!rst_n) 
				begin
					for (i = 0; i < 16; i = i + 1)
						dram_mem[i] <= 16'b0;
					data_out_a <= 16'b0;
					data_out_b <= 16'b0;
					refresh_counter <= 4'b0;
				end 
			else 
				begin
					// Port A operations
					if (we_a)
						dram_mem[addr_a] <= data_in_a;
					if (read_en_a)
						data_out_a <= dram_mem[addr_a];

					// Port B operations
					if (we_b)
						dram_mem[addr_b] <= data_in_b;
					if (read_en_b)
						data_out_b <= dram_mem[addr_b];

					// Refresh simulation
					if (refresh_en) 
						begin
							for (i = 0; i < 16; i = i + 1)
								dram_mem[i] <= dram_mem[i] + 0;  // Dummy write to simulate access
							refresh_counter <= refresh_counter + 1;
						end
				end
		end

endmodule