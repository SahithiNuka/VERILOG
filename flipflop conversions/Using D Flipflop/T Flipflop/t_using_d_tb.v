module t_using_d_tb();
  	reg t,clk,rst;
  	wire q,qb;
  
 	t_using_d tff(t,clk,rst,q,qb);
  
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
            $display("t=%b,q=%b,qb=%b",t,q,qb);
        	t = 1'b1;
        	#10;
          	$display("t=%b,q=%b,qb=%b",t,q,qb);
          	t = 1'b0;
          	#10;
            $display("t=%b,q=%b,qb=%b",t,q,qb);
          	t = 1'b1;
          	#10;
            $display("t=%b,q=%b,qb=%b",t,q,qb);
        	$finish;
      	end
endmodule
      