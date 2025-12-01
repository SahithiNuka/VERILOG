module eprom_tb();

    reg clk;
    reg [3:0] addr;
    reg we;
    reg erase;
    reg [15:0] write_data;
    wire [15:0] data;

    eprom(clk,addr,we,write_data,erase,data);

    always #5 clk = ~clk;

    initial begin
        clk = 1; 
        we = 0; 
        erase = 0; 
        write_data = 16'h0000; 
        addr = 4'b0000;
    
        #10 addr = 4'b0111;
        #10 addr = 4'b1000;
        #10 addr = 4'b1001;
        #10 addr = 4'b1010;
        #10 addr = 4'b1011;
        #10 addr = 4'b1100;      

        erase = 1;
        #10 erase = 0;
        #10 addr = 4'b1010;

        
        #10 we = 1; addr = 4'b0001; write_data = 16'hF934;
        #10 we = 1; addr = 4'b0010; write_data = 16'h3E50;
        #10 we = 1; addr = 4'b0011; write_data = 16'h9A76;
        #10 we = 1; addr = 4'b0100; write_data = 16'h6B56;
        #10 we = 0; addr = 4'b0010; addr = 4'b0100;
        
        #10 we = 1; addr = 4'b0101; write_data = 16'h0055;
        #10 we = 1; addr = 4'b0111; write_data = 16'h0039;
        #10 we = 0;
        #10 addr = 4'b0101;
        #10 addr = 4'b0111;

        #10;
		$finish;
    end
	
	initial
		$monitor("we=%b, erase=%b, addr=%b, write_data=%h, data=%h",we,erase,addr,write_data,data);

	initial
		begin
			$dumpfile("dump.vcd");
			$dumpvars;
		end
endmodule