module bin_to_onehot_tb();
	reg en;
	reg [3:0]bin;
	wire [31:0]one_hot;
	
	integer i;
	
	bin_to_onehot boh(en,bin,one_hot);
	
	initial
		begin
			for(i=0; i<32; i=i+1)
				begin
					bin = $random;
					en = $random;
					$display("bin=%b,en=%b,one_hot=%b",bin,en,one_hot);
					#10;
				end
			$finish;
		end
endmodule