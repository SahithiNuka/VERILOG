module rom_tb();
	reg [2:0] addr;
	wire [7:0] data;
	
	rom DUT(.addr(addr),.data(data));
	
	initial
		begin
			addr = 3'd0; #10;
			addr = 3'd1; #10;
			addr = 3'd2; #10;
			addr = 3'd3; #10;
			addr = 3'd4; #10;
			addr = 3'd5; #10;
			addr = 3'd6; #10;
			addr = 3'd7; #10;
			addr = 3'd3; #10;
			$finish;
		end
	initial
		begin
			$display("rom data:");
			$monitor("addr=%d : data=%h",addr,data);
		end
endmodule