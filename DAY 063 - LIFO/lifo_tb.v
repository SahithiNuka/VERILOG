
module lifo_tb();
	parameter WIDTH=8, STACK_DEPTH=16;
	
	reg clk,rst,write_en,read_en;
	reg [WIDTH-1:0]din;
	wire empty,full;
	wire [WIDTH-1:0]dout;
	
	lifo l1(clk, rst, write_en, read_en, din, empty, full, dout);
	
	initial
		begin
			clk = 1'b0;
			forever #5 clk = ~clk;
		end
	
	task initialize();
		begin
			rst = 1'b0;
			write_en = 1'b0;
			read_en = 1'b0;
		end
	endtask
	
	task reset;
		begin
			@(negedge clk)
			rst = 1'b0;
			@(negedge clk)
			rst = 1'b1;
		end
	endtask
	
	task write(input [7:0]data);
		begin
			@(negedge clk)
			write_en = 1'b1;
			din = data;
		end
	endtask
	
	task read();
		begin
			@(negedge clk)
			read_en = 1'b1;
		end
	endtask
	
	task delay();
		begin
			#50;
		end
	endtask
	
	
	initial
		begin
			initialize;
			delay;
			reset;
			repeat(17)
				write({$random}%16);
			write_en = 1'b0;
			repeat(17)
				read();
			read_en = 1'b0;
			reset;
 	        repeat(20)
				write({$random}%256);
			write_en = 1'b0;
 	        repeat(20)
				read();
			read_en = 1'b0;
			$finish;
			
		end
		
	initial
		$monitor("din=%d,dout=%d",din,dout);
		
	initial
      	begin
          	$dumpfile("dump.vcd");
          	$dumpvars();
        end
		
endmodule