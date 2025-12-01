module prom(prog_en, prog_addr, prog_data, addr, data);
    input  wire prog_en;    // Program enable (one-time write)
    input  wire [3:0] prog_addr;    // Address to program
    input  wire [7:0] prog_data;    // Data to program

    input  wire [3:0] addr;         // Read address
    output reg  [7:0] data;          // Read data

    // PROM memory array (16 x 8)
    reg [7:0] prom_mem [0:15];

    // PROGRAM OPERATION
    always @(posedge prog_en) begin
        prom_mem[prog_addr] <= prog_data;
    end

    // READ OPERATION
    always @(*) begin
        data = prom_mem[addr];
    end

endmodule
