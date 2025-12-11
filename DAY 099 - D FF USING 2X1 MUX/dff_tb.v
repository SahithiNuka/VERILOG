module dff_tb();
	reg clk,d;
	wire q;

	dff_using_mux(d,clk,q);

	initial 
		begin
			clk=0;
			forever #5 clk=~clk;
		end

	initial 
		begin
			$monitor(" d=%b, q=%b",d,q);
			d=1;
			#13 d=0;
			#10 d=1;
			#10 d=0;
			#15;
			$finish;
		end
  
  initial
		begin
			$dumpfile("dump.vcd");
			$dumpvars;
		end
endmodule