module bin_to_bcd(bin,bcd);
  input [3:0]bin;
  output [4:0]bcd;
  
  wire w1,w2,w3;
  
  not n1(w1,bin[1]);
  not n2(w2,bin[2]);
  not n3(w3,bin[3]);
  
  assign bcd[0] = bin[0];
  assign bcd[1] = (bin[3] & w1) | (bin[3] & bin[2] & w1);
  assign bcd[2] = (w3 & bin[2]) | (bin[2] & bin[1]);
  assign bcd[3] = (bin[3] & w2 & w1);
  assign bcd[4] = (bin[3] & bin[2]) | (bin[3] & bin[1]);
  
endmodule