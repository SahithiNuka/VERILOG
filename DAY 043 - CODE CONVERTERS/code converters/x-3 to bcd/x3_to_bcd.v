module x3_to_bcd(x,b);
  input [3:0]x;
  output [3:0]b;
  
  wire w0,w1,w2;
  not n1(w0,x[0]);
  not n2(w1,x[1]);
  not n3(w2,x[2]);
  
  assign b[0] = w0;
  assign b[1] = (w1 & x[0]) | (x[1] & w0);
  assign b[2] = (w2 & w1) | (w2 & w0) | (x[2] & x[1] & x[0]);
  assign b[3] = (x[3] & x[2]) | (x[3] & x[1] & x[0]); 
  
endmodule