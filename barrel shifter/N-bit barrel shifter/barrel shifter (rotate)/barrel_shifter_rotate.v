module barrel_shifter_rotate #(parameter N=8) (din,sh_amt,dir,dout);
	input [N-1:0]din;
	input [$clog2(N)-1:0]sh_amt; //shift amount (log2(N) bits)
	input dir; //0-left, 1-right
	output reg [N-1:0]dout;
	
	always@(*)
		begin
			if(dir == 0)
				dout = (din << sh_amt) | (din >> (N - sh_amt));
			else
				dout = (din >> sh_amt) | (din << (N - sh_amt));
		end
	
	endmodule