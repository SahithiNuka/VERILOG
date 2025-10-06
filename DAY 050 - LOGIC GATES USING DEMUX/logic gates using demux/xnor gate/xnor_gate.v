//XNOR GATE
module xnor_gate(a,b,y);
	input a,b;
	output y;
	
	wire w1,w2,w3;
	
	demux_1x2 d1(a,b,w1,1'b0);
	demux_1x2 d2(b,a,w2,1'b0);
	demux_1x2 d3(1'b1,w1,w3,1'b0);
	demux_1x2 d4(w3,w2,y,1'b0);
endmodule

module demux_1x2(i,s,y0,y1);
	input i,s;
	output y0,y1;
	
	assign y0 = !s & i;
	assign y1 = s & i;

endmodule