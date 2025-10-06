module controlled_buffer_reg_tb();
  	reg clk,clr,load;
  	reg [4:1]x;
  	wire [4:1]q;
  
  
  	controlled_buffer_reg cbr(clk,clr,load,x,q);
  
  	initial
      	begin
          	clk = 1'b0;
          	forever #5 clk = ~clk;
        end
  
  	initial
      	begin
      		clr = 1'b1;
          	#15;
          	clr = 1'b0;
          	load = 1'b1;
          	x = 4'b1010;
          	#10;
          	x = 4'b0100;
          	#10;
          	x = 4'b1111;
          	#10;
          	load = 1'b0;
          	x = 1100;
          	#10;
          	x = 0101;
          	#10;
          	$finish;
        end
  	initial
      	$monitor("clr=%b,load=%b,x=%b,q=%b",clr,load,x,q);
endmodule