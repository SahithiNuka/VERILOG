module usr_tb();
	reg clk,rst_n,s1,s0,sr,sl;
	reg [3:0]pdin;
	wire [3:0]pdout;
	
	universal_shift_reg usr(clk,rst_n,s1,s0,sr,sl,pdin,pdout);
	
	initial
		begin
			clk = 1'b0;
			forever #5 clk = ~clk;
		end
	
	initial
		begin
			rst_n = 1'b0;
			#10;
			rst_n = 1'b1;
			{s1,s0} = 2'b00;
			#10;
			//shift right
			{s1,s0} = 2'b01;
			sr = 1'b1;
			#10;
			sr = 1'b0;
			#10;
			sr = 1'b1;
			#10;
			sr = 1'b1;
			#10;
			rst_n = 1'b0;
			#10;
			rst_n = 1'b1;
			//shift left
			{s1,s0} = 2'b10;
			sl = 1'b0;
			#10;
			sl = 1'b1;
			#10;
			sl = 1'b1;
			#10;
			sl = 1'b0;
			#10;
			//parallel
          	rst_n = 1'b0;
			#10;
			rst_n = 1'b1;
			{s1,s0} = 2'b11;
			pdin = 4'b1111;
			#20;
			$finish;
		end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
endmodule
			