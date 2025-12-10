module decoder_3x8_using_demux(a,y);
    input [2:0] a;
    output [7:0] y;

    demux_1x8 u1(1'b1,a,y);
endmodule


module demux_1x8(din,sel,dout);
    input din;// input data (will be tied to 1 for decoder)
    input [2:0] sel;
    output reg [7:0] dout;
	
    always @(*) 
		begin
			dout = 8'b0;
			case (sel)
				3'b000: dout[0] = din;
				3'b001: dout[1] = din;
				3'b010: dout[2] = din;
				3'b011: dout[3] = din;
				3'b100: dout[4] = din;
				3'b101: dout[5] = din;
				3'b110: dout[6] = din;
				3'b111: dout[7] = din;
			endcase
		end
endmodule
