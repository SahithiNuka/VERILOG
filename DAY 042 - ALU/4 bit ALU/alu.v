module alu(a,b,opcode,result);
	input [3:0]a,b;
	input [3:0]opcode;
	output reg [7:0]result;
	
	always@(*)
		begin
			case(opcode)
				0: result = a + b;
				1: result = a - b;
				2: result = a * b;
				3: result = a / b;
				4: result = a % b;
				5: result = a + 1;
				6: result = a - 1;
				7: result = a ** 2;
				8: result = a & b;
				9: result = a | b;
				10: result = ~b;
				11: result = a ^ b;
				12: result = ~(a&b);
				13: result = ~(a|b);
				14: result = a << 1;
				15: result = a >> 1;
				default: result = 8'bx;
			endcase
		end
endmodule