module magnitude_comparator_using_decoder_tb();

    reg [1:0] A,B;
    wire gt,eq,lt;
	
	integer i,j;

    magnitude_comparator_using_decoder comp(A,B,gt,eq,lt);

    initial 
		begin
			for (i=0; i<4; i++) 
				begin
					for (j=0; j<4; j++) 
						begin
							A=i; B=j; 
							#10;
						end
				end
			$finish;
		end
		
	initial
		$monitor("a=%d, b=%0d | gt=%b, eq=%b, lt=%b", A,B,gt,eq,lt);
endmodule
