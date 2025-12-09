module pla_tb;

    reg A, B, C, D;
    wire F1, F2, F3;

    pla p(A, B, C, D, F1, F2, F3);

    initial 
		begin
			$display("A B C D | F1 F2 F3");
			$monitor("%b %b %b %b | %b  %b  %b", A,B,C,D,F1,F2,F3);
			for (integer i = 0; i < 16; i = i + 1) 
				begin
					{A,B,C,D} = i;
					#10;
				end
				$finish;
		end

endmodule
