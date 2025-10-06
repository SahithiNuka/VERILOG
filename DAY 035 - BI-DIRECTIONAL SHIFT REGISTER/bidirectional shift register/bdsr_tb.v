module bdsr_tb();

    reg clk, clr, mode, dr, dl;
    wire [3:0] q;

    // Instantiate DUT
    bidir_shift_reg_gate bdr (clk,clr,mode,dr,dl,q);

    // Clock generation
    always #5 clk = ~clk;

    initial 
		begin
			clk = 0; 
			clr = 0; 
			#10 
			clr = 1;
			//Right Shift
			mode = 1;  // Right
			dr = 1; #10;
			dr = 0; #10;
			dr = 1; #10;
			dr = 1; #10;

          	clr = 1'b0;
          	#10;
          	clr = 1'b1;
			//Left Shift
			mode = 0;  // Left
			dl = 1; #10;
			dl = 1; #10;
			dl = 1; #10;
			dl = 0; #10;
			$finish;
    end
	initial
      $monitor("time:%t,mode:%b,dr=%b,dl=%b,q=%b", $time,mode,dr,dl,q);
		
endmodule
