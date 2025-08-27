module mux8x1_decoder_tristate (
    input  [7:0] d,       // 8 data inputs
    input  [2:0] sel,     // 3-bit select
    output       y        // Output
);

    wire [7:0] dec;       // decoder outputs

    // 3:8 decoder
    assign dec[0] = (~sel[2]) & (~sel[1]) & (~sel[0]);
    assign dec[1] = (~sel[2]) & (~sel[1]) &  (sel[0]);
    assign dec[2] = (~sel[2]) &  (sel[1]) & (~sel[0]);
    assign dec[3] = (~sel[2]) &  (sel[1]) &  (sel[0]);
    assign dec[4] =  (sel[2]) & (~sel[1]) & (~sel[0]);
    assign dec[5] =  (sel[2]) & (~sel[1]) &  (sel[0]);
    assign dec[6] =  (sel[2]) &  (sel[1]) & (~sel[0]);
    assign dec[7] =  (sel[2]) &  (sel[1]) &  (sel[0]);

    // Tri-state buffer implementation
    assign y = (dec[0]) ? d[0] : 1'bz;
    assign y = (dec[1]) ? d[1] : 1'bz;
    assign y = (dec[2]) ? d[2] : 1'bz;
    assign y = (dec[3]) ? d[3] : 1'bz;
    assign y = (dec[4]) ? d[4] : 1'bz;
    assign y = (dec[5]) ? d[5] : 1'bz;
    assign y = (dec[6]) ? d[6] : 1'bz;
    assign y = (dec[7]) ? d[7] : 1'bz;

endmodule
