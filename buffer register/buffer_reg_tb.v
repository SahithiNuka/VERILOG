module buffer_reg_tb();
  	reg clk,rst;
  	reg [3:0]x;
  	wire [3:0]q;
  
  	integer i;
 	buffer_reg br(clk,rst,x,q);
  
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
          	for(i=0; i<16; i=i+1)
            	begin
                  	x = i;
                  	#10;
                end
          $finish;
        end
  
  	initial
      	$monitor("time=%t,x=%b,q=%b",$time,x,q);
endmodule
