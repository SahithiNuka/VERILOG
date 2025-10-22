module x3_adder(a,b,cin,x,cout);
	input [3:0]a,b;
	input cin;
	output [3:0]x;
	output cout;
	
	wire [3:0]s;
	wire [7:0]c;
	
	wire w1;
	
	fa f1(a[0],b[0],cin,s[0],c[0]);
	fa f2(a[1],b[1],c[0],s[1],c[1]);
	fa f3(a[2],b[2],c[1],s[2],c[2]);
	fa f4(a[3],b[3],c[2],s[3],c[3]);
	
	not n1(w1,c[3]);
	
	fa f5(c[3],s[0],c[7],x[0],c[4]);
	fa f6(c[3],s[1],c[4],x[1],c[5]);
	fa f7(w1,s[2],c[5],x[2],c[6]);
	fa f8(w1,s[3],c[6],x[3],c[7]);
	
	assign cout = c[3];
endmodule

module fa(a,b,cin,sum,cout);
	input a,b,cin;
	output sum,cout;
	
	assign sum = a ^ b ^ cin;
	assign cout = (a&b) | (b&cin) | (a&cin);
endmodule