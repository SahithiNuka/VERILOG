module bin_to_x3(b,x);
  input [3:0]b;
  output [3:0]x;
  
  wire w0,w1,w2;
  
  not n1(w0,b[0]);
  not n2(w1,b[1]);
  not n3(w2,b[2]);
  
  assign x[0] = w0;
  assign x[1] = b[0] ^~ b[1];
  assign x[2] = (w2 & (b[0] | b[1])) | (w0 & w1 & b[2]);
  assign x[3] = (b[2] & (b[0] | b[1])) | b[3];
  
endmodule