/*module mux_5x1(i,s,y);
	input [4:0]i;
	input [2:0]s;
	output y;
	
	wire w1,w2,w3,w4;
	
	mux_2x1 m1(i[0],i[1],s[0],w1);
	mux_2x1 m2(i[2],i[3],s[0],w2);
	mux_2x1 m3(i[4],1'b0,s[0],w3);
	
	mux_2x1 m4(w1,w2,s[1],w4);
	
	mux_2x1 m5(w4,w3,s[2],y);
	
endmodule
*/
module mux_5x1(i,s,y);
	input [4:0]i;
	input [2:0]s;
	output y;
	
	wire w1,w2,w3;
	
	mux_2x1 m1(i[0],i[1],s[0],w1);
	mux_2x1 m2(i[2],i[3],s[0],w2);
	mux_2x1 m3(w1,w2,s[1],w3);
	mux_2x1 m4(w3,i[4],s[2],y);
	
endmodule

module mux_2x1(a,b,s,y);
	input a,b,s;
	output y;
	
	assign y = (!s & a) | (s & b);
endmodule