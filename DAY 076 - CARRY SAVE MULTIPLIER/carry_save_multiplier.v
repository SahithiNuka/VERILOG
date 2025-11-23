module carry_save_multiplier(y,z,p);
	input [3:0]y,z;
	output [7:0]p;
	
	wire[15:0]pp; //partial products
	wire [11:0]s,c;
	
	assign pp[0] = y[0] & z[0],
			pp[1] = y[0] & z[1],
			pp[2] = y[0] & z[2],
			pp[3] = y[0] & z[3],
			pp[4] = y[1] & z[0],
			pp[5] = y[1] & z[1],
			pp[6] = y[1] & z[2],
			pp[7] = y[1] & z[3],
			pp[8] = y[2] & z[0],
			pp[9] = y[2] & z[1],
			pp[10] = y[2] & z[2],
			pp[11] = y[2] & z[3],
			pp[12] = y[3] & z[0],
			pp[13] = y[3] & z[1],
			pp[14] = y[3] & z[2],
			pp[15] = y[3] & z[3];
			
	//stage 1
	ha h1(pp[1],pp[4],s[0],c[0]);
	fa f1(pp[2],pp[5],pp[8],s[1],c[1]);
	fa f2(pp[12],pp[9],pp[6],s[2],c[2]);
	ha h2(pp[13],pp[10],s[3],c[3]);
	
	//stage 2
	ha h3(c[0],s[1],s[4],c[4]);
	fa f3(c[1],s[2],pp[3],s[5],c[5]);
	fa f4(c[2],s[3],pp[7],s[6],c[6]);
	fa f5(c[3],pp[11],pp[14],s[7],c[7]);
	
	//stage 3
	ha h4(c[4],s[5],s[8],c[8]);
	fa f6(c[8],c[5],s[6],s[9],c[9]);
	fa f7(c[9],c[6],s[7],s[10],c[10]);
	fa f8(c[10],c[7],pp[15],s[11],c[11]);
	
	assign p[0] = pp[0],
			p[1] = s[0],
			p[2] = s[4],
			p[3] = s[8],
			p[4] = s[9],
			p[5] = s[10],
			p[6] = s[11],
			p[7] = c[11];
			
endmodule

module ha(a,b,s,c);
	input a,b;
	output s,c;
	
	assign s = a^b,
			c = a&b;
endmodule

module fa(a,b,cin,s,cout);
	input a,b,cin;
	output s,cout;
	
	assign s = a^b^cin,
			cout = a&b | b&cin | cin&a;
endmodule