module wallace_multiplier(a,b,product);
	input [3:0]a,b;
	output [7:0]product;
	
	wire p00,p01,p02,p03,p10,p11,p12,p13,p20,p21,p22,p23,p30,p31,p32,p33;
	wire s01,s02,s03,s04,s11,s12,s13,s14,s21,s22,s23,s24;
	wire c01,c02,c03,c04,c11,c12,c13,c14,c21,c22,c23,c24;
	
	assign p00 = a[0] & b[0],
			p01 = a[1] & b[0],
			p02 = a[2] & b[0],
			p03 = a[3] & b[0],
			p10 = a[0] & b[1],
			p11 = a[1] & b[1],
			p12 = a[2] & b[1],
			p13 = a[3] & b[1],
			p20 = a[0] & b[2],
			p21 = a[1] & b[2],
			p22 = a[2] & b[2],
			p23 = a[3] & b[2],
			p30 = a[0] & b[3],
			p31 = a[1] & b[3],
			p32 = a[2] & b[3],
			p33 = a[3] & b[3];
			
			
			//stage 1
			ha h1(p01,p10,s01,c01);
			fa f1(p20,p11,p02,s02,c02);
			fa f2(p03,p12,p21,s03,c03);
			ha h2(p13,p22,s04,c04);
			
			//stage 2
			ha h3(c01,s02,s11,c11);
			fa f3(c02,p30,s03,s12,c12);
			fa f4(c03,p31,s04,s13,c13);
			fa f5(c04,p32,p23,s14,c14);
			
			//stage 3
			ha h4(c11,s12,s21,c21);
			fa f6(c21,c12,s13,s22,c22);
			fa f7(c22,c13,s14,s23,c23);
			fa f8(c23,c14,p33,s24,c24);
			
			assign product[0] = p00;
			assign product[1] = s01;
			assign product[2] = s11;
			assign product[3] = s21;
			assign product[4] = s22;
			assign product[5] = s23;
			assign product[6] = s24;
			assign product[7] = c24;

endmodule


module ha(a,b,s,c);
	input a,b;
	output s,c;
	
	assign s = a ^ b,
			c = a & b;
endmodule


module fa(a,b,cin,s,cout);
	input a,b,cin;
	output s,cout;
	
	assign s = a^b^cin,
			cout = (a&b) | (b&cin) | (cin&a);
	
endmodule