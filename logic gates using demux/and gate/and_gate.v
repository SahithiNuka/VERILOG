//AND GATE
module and_gate(a,b,y);
	input a,b;
	output y;
	
	demux_1x2 d1(b,a,1'b0,y);
endmodule

module demux_1x2(i,s,y0,y1);
	input i,s;
	output y0,y1;
	
	assign y0 = !s & i;
	assign y1 = s & i;

endmodule