module decoder_mux(a,b,y);
	input a,b;
	output [3:0]y;
	
	wire w1;
	not n1(w1,b);
	
	mux_21 m1(w1,1'b0,a,y[0]);
	mux_21 m2(b,1'b0,a,y[1]);
	mux_21 m3(1'b0,w1,a,y[2]);
	mux_21 m4(1'b0,b,a,y[3]);
	
endmodule

module mux_21(a,b,s,y);
	input a,b,s;
	output y;
	
	assign y = (!s & a) | (s & b);
	
endmodule