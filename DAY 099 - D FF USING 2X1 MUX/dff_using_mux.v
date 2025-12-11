module dff_using_mux(d,clk,q);
	input d,clk;
	output q;

	wire w1,w2;

	mux_2x1 m0(w1,d,~clk,w1);
	mux_2x1 m1(q,d,clk,w2);

	assign q = w2;
endmodule


module mux_2x1(x1,x2,s,f);
	input x1,x2,s;
	output reg f;

	always@(x1,x2,s) 
		begin
			if(s)
				f=x2;
			else if(!s)
				f=x1;
			else
				f=1'bx;
		end
endmodule