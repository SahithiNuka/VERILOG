module d_using_t_tb();
  	reg d,clk,rst;
  	wire q,qb;
  
  	d_using_t dff(d,clk,rst,q,qb);
  
  	initial
    	begin
      		clk = 1'b0;
          	forever #5 clk = ~clk;
        end
  	
  	initial
      	begin
        	rst = 1'b1;
        	#15;
          	$display("d=%b,q=%b,qb=%b",d,q,qb);
        	rst = 1'b0;
        	d = 1'b0;
        	#10;
          	$display("d=%b,q=%b,qb=%b",d,q,qb);
        	d = 1'b1;
        	#10;
          	$display("d=%b,q=%b,qb=%b",d,q,qb);
          	d = 1'b0;
        	#10;
          	$display("d=%b,q=%b,qb=%b",d,q,qb);
        	d = 1'b1;
        	#10;
          	$display("d=%b,q=%b,qb=%b",d,q,qb);
        	$finish;
      	end
  	//initial
      //$monitor("time=%t rst=%b, d=%b, q=%b, qb=%b",$time,rst,d,q,qb);
endmodule