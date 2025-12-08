module pal_tb;

    reg A, B, C, D;
    wire F1, F2, F3, F4;

    pal p(A,B,C,D,F1, F2, F3, F4);

    initial 
		begin
			$display("A B C D | F1 F2 F3 F4");
			$monitor("%b %b %b %b | %b  %b  %b  %b", A,B,C,D,F1,F2,F3,F4);

			repeat(16) 
				begin
					{A,B,C,D} = $random;
					#10;
				end
			$finish;
		end

endmodule
