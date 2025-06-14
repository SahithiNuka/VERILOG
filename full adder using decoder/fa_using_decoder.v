module fa_using_decoder(a,b,c,sum,carry);
	input a,b,c;
	output sum,carry;
	wire[7:0]w;

	decoder d1(a,b,c,w);

	assign sum = w[1] | w[2] | w[4] | w[7];
	assign carry = w[3] | w[5] | w[6] | w[7];
endmodule

module decoder(a,b,c,y);
	input a,b,c;
	output reg [7:0]y;
  
	always@(*)
		begin
			case({a,b,c})
				0: y = 8'd1;
				1: y = 8'd2;
				2: y = 8'd4;
				3: y = 8'd8;
				4: y = 8'd16;
				5: y = 8'd32;
				6: y = 8'd64;
				7: y = 8'd128;
				default: y = 8'd0;
			endcase
		end
endmodule