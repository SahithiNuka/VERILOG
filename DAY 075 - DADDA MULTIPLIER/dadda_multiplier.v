module dadda_multiplier(a,b,y);
	input [7:0]a,b;
	output [15:0]y;
	
	wire pp[0:7][7:0]; //partial products
	wire [5:0]s1,c1; //stage 1
	wire [13:0]s2,c2; //stage 2
	wire [9:0]s3,c3; //stage 3
	wire [11:0]s4,c4; //stage 4
	wire [13:0]c5; //stage 5
	
	genvar i,j;
	
	for(i=0; i<8; i=i+1)
		begin
			for(j=0; j<8; j=j+1)
				begin
					assign pp[i][j] = a[j]*b[i];
				end
		end
		
	
	//stage 1
	ha h1(pp[6][0],pp[5][1],s1[0],c1[0]);
	fa f1(pp[7][0],pp[6][1],pp[5][2],s1[1],c1[1]);
	ha h2(pp[4][3],pp[3][4],s1[2],c1[2]);
	fa f2(pp[7][1],pp[6][2],pp[5][3],s1[3],c1[3]);
	ha h3(pp[4][4],pp[3][5],s1[4],c1[4]);
	fa f3(pp[7][2],pp[6][3],pp[5][4],s1[5],c1[5]);
	
	
	//stage 2
	ha h4(pp[4][0],pp[3][1],s2[0],c2[0]);
	fa f4(pp[5][0],pp[4][1],pp[3][2],s2[1],c2[1]);
	ha h5(pp[2][3],pp[1][4],s2[2],c2[2]);
	fa f5(s1[0],pp[4][2],pp[3][3],s2[3],c2[3]);
	fa f6(pp[2][4],pp[1][5],pp[0][6],s2[4],c2[4]);
	fa f7(c1[0],s1[1],s1[2],s2[5],c2[5]);
	fa f8(pp[2][5],pp[1][6],pp[0][7],s2[6],c2[6]);
	fa f9(c1[1],c1[2],s1[3],s2[7],c2[7]);
	fa f10(s1[4],pp[2][6],pp[1][7],s2[8],c2[8]);
	fa f11(c1[3],c1[4],s1[5],s2[9],c2[9]);
	fa f12(pp[4][5],pp[3][6],pp[2][7],s2[10],c2[10]);
	fa f13(c1[5],pp[7][3],pp[6][4],s2[11],c2[11]);
	fa f14(pp[5][5],pp[4][6],pp[3][7],s2[12],c2[12]);
	fa f15(pp[7][4],pp[6][5],pp[5][6],s2[13],c2[13]);
	
	
	//stage 3
	ha h6(pp[3][0],pp[2][1],s3[0],c3[0]);
	fa f16(s2[0],pp[2][2],pp[1][3],s3[1],c3[1]);
	fa f17(c2[0],s2[1],s2[2],s3[2],c3[2]);
	fa f18(c2[1],c2[2],s2[3],s3[3],c3[3]);
	fa f19(c2[3],c2[4],s2[5],s3[4],c3[4]);
	fa f20(c2[5],c2[6],s2[7],s3[5],c3[5]);
	fa f21(c2[7],c2[8],s2[9],s3[6],c3[6]);
	fa f22(c2[9],c2[10],s2[11],s3[7],c3[7]);
	fa f23(c2[11],c2[12],s2[13],s3[8],c3[8]);
	fa f24(c2[13],pp[7][5],pp[6][6],s3[9],c3[9]);
	
	
	//stage 4
	ha h7(pp[2][0],pp[1][1],s4[0],c4[0]);
	fa f25(s3[0],pp[1][2],pp[0][3],s4[1],c4[1]);
	fa f26(c3[0],s3[1],pp[0][4],s4[2],c4[2]);
	fa f27(c3[1],s3[2],pp[0][5],s4[3],c4[3]);
	fa f28(c3[2],s3[3],s2[4],s4[4],c4[4]);
	fa f29(c3[3],s3[4],s2[6],s4[5],c4[5]);
	fa f30(c3[4],s3[5],s2[8],s4[6],c4[6]);
	fa f31(c3[5],s3[6],s2[10],s4[7],c4[7]);
	fa f32(c3[6],s3[7],s2[12],s4[8],c4[8]);
	fa f33(c3[7],s3[8],pp[4][7],s4[9],c4[9]);
	fa f34(c3[8],s3[9],pp[5][7],s4[10],c4[10]);
	fa f35(c3[9],pp[7][6],pp[6][7],s4[11],c4[11]);
	
	
	//stage 5
	ha h8(pp[1][0],pp[0][1],y[1],c5[0]);
	fa f36(s4[0],pp[0][2],c5[0],y[2],c5[1]);
	fa f37(c4[0],s4[1],c5[1],y[3],c5[2]);
	fa f38(c4[1],s4[2],c5[2],y[4],c5[3]);
	fa f39(c4[2],s4[3],c5[3],y[5],c5[4]);
	fa f40(c4[3],s4[4],c5[4],y[6],c5[5]);
	fa f41(c4[4],s4[5],c5[5],y[7],c5[6]);
	fa f42(c4[5],s4[6],c5[6],y[8],c5[7]);
	fa f43(c4[6],s4[7],c5[7],y[9],c5[8]);
	fa f44(c4[7],s4[8],c5[8],y[10],c5[9]);
	fa f45(c4[8],s4[9],c5[9],y[11],c5[10]);
	fa f46(c4[9],s4[10],c5[10],y[12],c5[11]);
	fa f47(c4[10],s4[11],c5[11],y[13],c5[12]);
	fa f48(c4[11],pp[7][3],c5[12],y[14],c5[13]);
	
	assign y[0] = pp[0][0];
	assign y[15] = c5[13];
	
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
			cout = a&b | b&cin | a&cin;
endmodule