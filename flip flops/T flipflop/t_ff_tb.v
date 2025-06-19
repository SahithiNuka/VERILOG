module t_ff_tb();
  	reg t,clk,rst;
  	wire q,qb;
  
 	t_flipflop tff(t,clk,rst,q,qb);
  
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
        	t = 1'b0;
        	#10;
        	t = 1'b1;
        	#10;
        	$finish;
      	end
  	initial
      $monitor("time=%t rst=%b, t=%b, q=%b, qb=%b",$time,rst,t,q,qb);
endmodule
      