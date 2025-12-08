module pal(A,B,C,D,F1, F2, F3, F4);
    input  wire A, B, C, D;
    output wire F1, F2, F3, F4; 
	
	//F1=A·B + C·D
	//F2=A·C' + B'·D
	//F3=A'·B + C·D' + A·D
	//F4=A·B·C + A'·C·D + B·D'
	
    // --- Programmable AND Array (Product Terms) ---
    wire p1  = A & B;        // For F1
    wire p2  = C & D;        // For F1 & F3
    wire p3  = A & ~C;       // For F2
    wire p4  = ~B & D;       // For F2
    wire p5  = ~A & B;       // For F3
    wire p6  = D & ~C;       // For F3
    wire p7  = A & D;        // For F3
    wire p8  = A & B & C;    // For F4
    wire p9  = ~A & C & D;   // For F4
    wire p10 = B & ~D;       // For F4

    // --- Fixed OR Array (Output Functions) ---
    assign F1 = p1 | p2;
    assign F2 = p3 | p4;
    assign F3 = p5 | p2 | p7 | p6;
    assign F4 = p8 | p9 | p10;

endmodule
