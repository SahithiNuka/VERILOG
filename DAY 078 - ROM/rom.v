module rom(addr,data);

	input  [2:0] addr;
	output reg [7:0] data;

	always @(*)
		begin
			case (addr)
				3'd0: data = 8'hAA;
				3'd1: data = 8'hB9;
				3'd2: data = 8'hCD;
				3'd3: data = 8'hD1;
				3'd4: data = 8'hEA;
				3'd5: data = 8'hF3;
				3'd6: data = 8'h9F;
				3'd7: data = 8'h98;
				default: data = 8'h00;
			endcase
		end
endmodule