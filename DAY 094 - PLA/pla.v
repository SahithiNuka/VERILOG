module pla(A, B, C, D, F1, F2, F3);
    input  A, B, C, D;
    output F1, F2, F3;

    // -------- Programmable AND Array --------
    wire p1 = A  & B;       // PT1
    wire p2 = ~A & C;       // PT2
    wire p3 = C  & D;       // PT3
    wire p4 = B  & ~D;      // PT4
    wire p5 = A  & ~C;      // PT5
    wire p6 = ~A & ~B;      // PT6
    wire p7 = A  & D;       // PT7
    wire p8 = ~C & D;       // PT8

    // -------- Programmable OR Array --------
    assign F1 = p1 | p2 | p4;     // F1 = PT1 + PT2 + PT4
    assign F2 = p3 | p6 | p7;     // F2 = PT3 + PT6 + PT7
    assign F3 = p2 | p5 | p8;     // F3 = PT2 + PT5 + PT8

endmodule
