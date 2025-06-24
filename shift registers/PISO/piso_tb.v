module piso_tb();
	reg clk,rst,sel;
	reg [3:0]pin;
	wire sout;
  
	piso p1(clk,rst,sel,pin,sout);
  
	always #1 clk = ~clk;
  
	initial
		begin
			clk = 1'b0;
			rst = 1'b1;
			#2;
			rst = 1'b0;
			sel = 1'b0;
			pin = 4'b1001;
			#2;
			sel = 1'b1;
			#10;
			sel = 1'b0;
			pin = 4'b1100;
			#2;
			sel = 1'b1;
			#25;
			$finish;
		end
  
	initial
		$monitor("pin=%b,sout=%b",pin,sout);
 
endmodule