module barrel_shifter_rotate(din,sh_amt,dir,dout);
	input [3:0]din;
	input [1:0]sh_amt; //shift amount
	input dir; // 0-left rotate, 1-right rotate
	output reg [3:0]dout;
	
	always@(*)
		begin
			if(dir == 0)
				begin
					case(sh_amt)
						0: dout = din;
						1: dout = {din[2:0],din[3]};
						2: dout = {din[1:0],din[3:2]};
						3: dout = {din[0],din[3:1]};
					endcase
				end
			else
				begin
					case(sh_amt)
						0: dout = din;
						1: dout = {din[0],din[3:1]};
						2: dout = {din[1:0],din[3:2]};
						3: dout = {din[2:0],din[3]};
					endcase
				end
		end
		
endmodule