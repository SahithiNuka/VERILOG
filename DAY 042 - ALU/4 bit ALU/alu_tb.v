module alu_tb();
	reg [3:0]a,b;
	reg [3:0]opcode;
	wire [7:0]result;
	
	integer i;
	
	alu a1(a,b,opcode,result);
	
	initial
		begin
			for(i=0; i<20; i=i+1)
				begin
					a = $random();
					b = $random();
					opcode = $random();
					$display("a=%b,b=%b,opcode=%b,result=%b",a,b,opcode,result);
					#10;
				end
				$finish;
		end
endmodule