module mux_10x1(i,s,y);
	input [9:0]i;
	input [3:0]s;
	output y;
	
	wire w1,w2,w3;
	
	mux_4x1 m1(i[0],i[1],i[2],i[3],s[1],s[0],w1);
	mux_4x1 m2(i[4],i[5],i[6],i[7],s[1],s[0],w2);
	mux_4x1 m3(i[8],i[9],1'b0,1'b0,s[1],s[0],w3);
	mux_4x1 m4(w1,w2,w3,1'b0,s[3],s[2],y);
endmodule


//this doesn't work correctly 
/*module mux_10x1(i,s,y);
	input [9:0]i;
	input [3:0]s;
	output y;
	
	wire w1,w2;
	
	mux_4x1 m1(i[0],i[1],i[2],i[3],s[1],s[0],w1);
	mux_4x1 m2(i[4],i[5],i[6],i[7],s[1],s[0],w2);
	mux_4x1 m3(w1,w2,i[8],i[9],s[3],s[2],y);
endmodule*/

module mux_4x1(a,b,c,d,s1,s0,y);
	input a,b,c,d,s1,s0;
	output reg y;
	
	always@(*)
		begin
			case({s1,s0})
				0: y = a;
				1: y = b;
				2: y = c;
				3: y = d;
			endcase
		end
endmodule