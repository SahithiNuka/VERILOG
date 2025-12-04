`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:14:32 03/23/2025 
// Design Name: 
// Module Name:    gates_using_nand 
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
module gates_using_nand(a, b, y);
    input a, b;
    output y;
	 
	 wire w1,w2,w3,w4;
	
	//and gate
	/*nand_gate a1 (a,b,w1);
	nand_gate a2 (w1,w1,y);
	*/
	
	//or gate
	/*nand_gate o1(a,a,w1);
	nand_gate o2(b,b,w2);
	nand_gate o3(w1,w2,y);
	*/
	
	//nor gate
	/*nand_gate o1(a,a,w1);
	nand_gate o2(b,b,w2);
	nand_gate o3(w1,w2,w3);
	nand_gate o4(w3,w3,y);
	*/
	
	//exor gate
	/*nand_gate a1(a,b,w1);
	nand_gate a2(a,w1,w2);
	nand_gate a3(b,w1,w3);
	nand_gate a4(w2,w3,y);
	*/
	
	//exnor gate
	nand_gate a1(a,b,w1);
	nand_gate a2(a,w1,w2);
	nand_gate a3(b,w1,w3);
	nand_gate a4(w2,w3,w4);
	nand_gate a5(w4,w4,y);
	
endmodule

module nand_gate(a, b, y);
	input a,b;
	output y;
	
	nand n1(a,b,y);
	
endmodule
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
