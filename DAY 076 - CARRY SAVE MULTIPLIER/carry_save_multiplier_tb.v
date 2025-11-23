module carry_save_multiplier_tb();
	reg [3:0]y,z;
	wire [7:0]p;
	
	carry_save_multiplier csm(y,z,p);
	
	initial
		begin
			y = 4'd0;
			z = 4'd0;
			#10;
			y = 4'd5;
			z = 4'd7;
			#10;
			y = 4'd8;
			z = 4'd9;
			#10;
			y = 4'd12;
			z = 4'd10;
			#10;
			y = 4'd15;
			z = 4'd15;
			#10;
			$finish;
		end
	initial
		$monitor("y=%d: %b, z=%d: %b, product=%d: %b",y,y,z,z,p,p);
endmodule