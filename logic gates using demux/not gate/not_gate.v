//NOT GATE//
module not_gate(a,y);
	input a;
	output y;
	
	demux_1x2 d1(1'b1,a,y,1'b0);
endmodule

module demux_1x2(i,s,y0,y1);
	input i,s;
	output y0,y1;
	
	assign y0 = !s & i;
	assign y1 = s & i;

endmodule