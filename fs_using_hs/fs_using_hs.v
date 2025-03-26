`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:16:00 03/24/2025 
// Design Name: 
// Module Name:    fs_using_hs 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module fs_using_hs(a,b,c,diff,borrow);
    input a,b,c;
    output diff,borrow;

	wire w1,w2,w3;

	hs h1(a,b,w1,w2);
	hs h2(w1,c,diff,w3);
	or o1(borrow,w2,w3);

endmodule



module hs(a,b,diff,borrow);
	input a,b;
	output diff,borrow;
	
	assign diff = a^b;
	assign borrow = !a&b;
	
endmodule
