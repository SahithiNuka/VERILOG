module magnitude_comparator_using_decoder(A,B,A_gt_B,A_eq_B,A_lt_B);
    input [1:0] A;
    input [1:0] B;
    output A_gt_B;
    output A_eq_B;
    output A_lt_B;

    wire [15:0] Y;
    wire [3:0] X;

    assign X = {A, B};

    decoder4x16 dec(X,Y);

    // A > B
    assign A_gt_B = Y[4] | Y[8] | Y[9] | Y[12] | Y[13] | Y[14];

    // A = B
    assign A_eq_B = Y[0] | Y[5] | Y[10] | Y[15];

    // A < B
    assign A_lt_B = Y[1] | Y[2] | Y[3] | Y[6] | Y[7] | Y[11];

endmodule

module decoder4x16(in,out)
    input  wire [3:0] in;
    output reg  [15:0] out;
	
    always @(*) 
		begin
			out = 16'b0;
			out[in] = 1'b1;
		end
endmodule
