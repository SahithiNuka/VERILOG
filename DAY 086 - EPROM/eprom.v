module eprom(clk,addr,we,write_data,erase,data);
    input wire clk;
    input wire [3:0] addr;
    input wire we;
    input wire [15:0] write_data;
    input wire erase;
    output reg [15:0] data;

    reg [15:0] eprom_mem [15:0];
    integer i;

    initial begin
        eprom_mem[0]  = 16'h0001; 
		eprom_mem[1]  = 16'h0002; 
		eprom_mem[2]  = 16'h0003; 
		eprom_mem[3]  = 16'h0004;
        eprom_mem[4]  = 16'h0005; 
		eprom_mem[5]  = 16'h0006; 
		eprom_mem[6]  = 16'h0007; 
		eprom_mem[7]  = 16'h0008;
        eprom_mem[8]  = 16'h0009; 
		eprom_mem[9]  = 16'h000A; 
		eprom_mem[10] = 16'h000B; 
		eprom_mem[11] = 16'h000C;
        eprom_mem[12] = 16'h000D; 
		eprom_mem[13] = 16'h000E; 
		eprom_mem[14] = 16'h000F; 
		eprom_mem[15] = 16'h0010;
    end

    always @(posedge clk) begin
        if (erase) begin
            for (i = 0; i < 16; i = i + 1) begin
                eprom_mem[i] <= 16'h0000;
            end
        end else if (we) begin
            eprom_mem[addr] <= write_data;
        end
    end

    always @(*) begin
        data = eprom_mem[addr];
    end

endmodule