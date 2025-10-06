module bcd_to_x3(bcd,x);
  input [3:0]bcd;
  output [3:0]x;
  
  wire w0,w1,w2;
  
  not n1(w0,bcd[0]);
  not n2(w1,bcd[1]);
  not n3(w2,bcd[2]);
  
  assign x[0] = w0;
  assign x[1] = (w1 & w0) | (bcd[1] & bcd[0]);
  assign x[2] = (bcd[2] & w1 & w0) | (w2 & bcd[0]) | (w2 & bcd[1]);
  assign x[3] = bcd[3] | (bcd[2] & bcd[1]) | (bcd[2] & bcd[0]);
  
endmodule
