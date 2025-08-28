module barrel_shifter_logical(din,sh_amt,dir,dout);
	input [3:0]din;
	input [1:0]sh_amt; //shift amount
	input dir; // 0-left shift, 1-right shift
	output reg [3:0]dout;
	
	always@(*)
		begin
			if(dir == 0)
				begin
					case(sh_amt)
						0: dout = din;
						1: dout = {din[2:0],1'b0};
						2: dout = {din[1:0],2'b00};
						3: dout = {din[0],3'b000};
					endcase
				end
			else
				begin
					case(sh_amt)
						0: dout = din;
						1: dout = {1'b0,din[3:1]};
						2: dout = {2'b00,din[3:2]};
						3: dout = {3'b000,din[3]};
					endcase
				end
		end

endmodule