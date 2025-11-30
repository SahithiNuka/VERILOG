module mask_rom(addr,data);
    input  wire [3:0] addr;
    output reg  [7:0] data;

    reg [7:0] rom [0:15];

    initial begin
        rom[0]  = 8'hA1;
        rom[1]  = 8'hB2;
        rom[2]  = 8'hC3;
        rom[3]  = 8'hD4;
        rom[4]  = 8'hE5;
        rom[5]  = 8'hF6;
        rom[6]  = 8'h12;
        rom[7]  = 8'h34;
        rom[8]  = 8'h56;
        rom[9]  = 8'h78;
        rom[10] = 8'h9A;
        rom[11] = 8'hBC;
        rom[12] = 8'hDE;
        rom[13] = 8'hF0;
        rom[14] = 8'h11;
        rom[15] = 8'h22;
    end

    // Read memory
    always @(*) begin
        data = rom[addr];
    end

endmodule
