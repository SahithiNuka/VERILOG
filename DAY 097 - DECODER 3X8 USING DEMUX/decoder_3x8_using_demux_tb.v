module decoder_3x8_using_demux_tb();

    reg [2:0] a;
    wire [7:0] y;

    decoder_3x8_using_demux dd (a,y);

    initial 
		begin
			for (integer i = 0; i < 8; i = i + 1) 
				begin
					a = i;
					#10;
				end
			$finish;
		end
		
	initial
		$monitor("a = %b, y = %b",a,y);
endmodule
