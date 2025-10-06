`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:33:19 03/30/2025 
// Design Name: 
// Module Name:    fs_using_ha 
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
module fs_using_ha(a,b,c,diff,borrow);
    input a,b,c;
    output diff,borrow;
	
	wire [4:0]w;
	
	not n1(w[0],a);
	
	ha h1(w[0],b,w[1],w[2]);
	ha h2(w[1],c,w[3],w[4]);
	
	not n2(diff,w[3]);
	or o1(borrow,w[2],w[4]);

endmodule

module ha(a,b,s,c);
	input a,b;
	output s,c;
	
	assign s=a^b;
	assign c=a&b;
endmodule
