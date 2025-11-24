module braun_multiplier(a,b,p);
	input [3:0]a,b;
	output [7:0]p;
	
	wire [15:0]pp; //partial products
	wire [11:0]s,c;
	
	assign pp[0] = a[0] & b[0],
			pp[1] = a[0] & b[1],
			pp[2] = a[0] & b[2],
			pp[3] = a[0] & b[3],
			pp[4] = a[1] & b[0],
			pp[5] = a[1] & b[1],
			pp[6] = a[1] & b[2],
			pp[7] = a[1] & b[3],
			pp[8] = a[2] & b[0],
			pp[9] = a[2] & b[1],
			pp[10] = a[2] & b[2],
			pp[11] = a[2] & b[3],
			pp[12] = a[3] & b[0],
			pp[13] = a[3] & b[1],
			pp[14] = a[3] & b[2],
			pp[15] = a[3] & b[3];
			
	//stage 1
	ha h1(pp[1],pp[4],s[0],c[0]);
	ha h2(pp[5],pp[8],s[1],c[1]);
	ha h3(pp[9],pp[12],s[2],c[2]);
	
	//stage 2
	fa f1(c[0],pp[2],s[1],s[3],c[3]);
	fa f2(c[1],pp[6],s[2],s[4],c[4]);
	fa f3(c[2],pp[10],pp[13],s[5],c[5]);
	
	//stage 3
	fa f4(c[3],pp[3],s[4],s[6],c[6]);
	fa f5(c[4],pp[7],s[5],s[7],c[7]);
	fa f6(c[5],pp[11],pp[14],s[8],c[8]);
	
	//stage 4
	ha h4(c[6],s[7],s[9],c[9]);
	fa f7(c[9],c[7],s[8],s[10],c[10]);
	fa f8(c[10],c[8],pp[15],s[11],c[11]);
	
	assign p[0] = pp[0],
			p[1] = s[0],
			p[2] = s[3],
			p[3] = s[6],
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