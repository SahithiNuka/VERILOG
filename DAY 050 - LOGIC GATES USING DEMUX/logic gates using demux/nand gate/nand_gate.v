//NAND GATE
module nand_gate(a,b,y);
	input a,b;
	output y;
	
	wire w1;
	
	demux_1x2 d1(b,a,1'b0,w1);
	demux_1x2 d2(1'b1,w1,y,1'b0);
endmodule

module demux_1x2(i,s,y0,y1);
	input i,s;
	output y0,y1;
	
	assign y0 = !s & i;
	assign y1 = s & i;

endmodule