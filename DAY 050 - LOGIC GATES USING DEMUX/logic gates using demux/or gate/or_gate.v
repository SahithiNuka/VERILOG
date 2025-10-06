//OR GATE
module or_gate(a,b,y);
	input a,b;
	output y;
	
	wire w1,w2;
	not n1(w1,b);
	
	demux_1x2 d1(w1,a,w2,1'b0);
	demux_1x2 d2(1'b1,w2,y,1'b0);
endmodule

module demux_1x2(i,s,y0,y1);
	input i,s;
	output y0,y1;
	
	assign y0 = !s & i;
	assign y1 = s & i;

endmodule