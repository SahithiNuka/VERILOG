
module mux8x1_decoder_tristate_tb;

	reg  [7:0] d;        
	reg  [2:0] sel;      
	wire y;              

	mux8x1_decoder_tristate uut (d,sel,y);

	integer i;
  
	initial 
		begin
			$monitor("Time=%0t | sel=%b | d=%b | y=%b", $time, sel, d, y);
			d = 8'b1010_1101;   
			
			for(i=0; i<8; i=i+1)
				begin
					sel = i;
					#10;
				end
			$finish;
		end

endmodule
