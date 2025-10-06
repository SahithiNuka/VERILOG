module jk_using_t_tb();
	reg j,k,clk,rst;
	wire q,qb;
  
	jk_using_t jk(j,k,clk,rst,q,qb);
  
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
			{j,k} = 0;
			#10;
			{j,k} = 1;
			#10;
			{j,k} = 2;
			#10;
			{j,k} = 3;
			#10;
          	{j,k} = 3;
         	#10;
			$finish;
		end
	initial
		$monitor("time: %t, rst=%b, j=%b, k=%b, q=%b, qb=%b",$time,rst,j,k,q,qb);
endmodule