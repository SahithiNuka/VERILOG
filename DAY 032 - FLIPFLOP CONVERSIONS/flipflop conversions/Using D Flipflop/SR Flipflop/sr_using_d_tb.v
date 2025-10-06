module sr_using_d_tb();
	reg s,r,clk,rst;
	wire q,qb;
  
	sr_using_d sr(s,r,clk,rst,q,qb);
  
	initial
		begin
			clk = 1'b0;
			forever #5 clk = ~clk;
		end
  
	initial
		begin
			rst = 1'b1;
			#15;
			rst = 1'b0;
			{s,r} = 0;
			#10;
			{s,r} = 1;
			#10;
			{s,r} = 2;
			#10;
			{s,r} = 3;
			#10;
			$finish;
		end
	initial
		$monitor("time: %t, rst=%b, s=%b, r=%b, q=%b, qb=%b",$time,rst,s,r,q,qb);
endmodule