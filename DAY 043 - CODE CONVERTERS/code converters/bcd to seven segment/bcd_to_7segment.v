
module bcd_to_7segment(bcd,a,b,c,d,e,f,g);
  input [3:0]bcd;
  output reg a,b,c,d,e,f,g;
  
  always@(bcd)
    begin
      case(bcd)
        0: {a,b,c,d,e,f,g} = 7'b1111110;
        1: {a,b,c,d,e,f,g} = 7'b0110000;
        2: {a,b,c,d,e,f,g} = 7'b1101101;
        3: {a,b,c,d,e,f,g} = 7'b1111001;
        4: {a,b,c,d,e,f,g} = 7'b0110011;
        5: {a,b,c,d,e,f,g} = 7'b1011011;
        6: {a,b,c,d,e,f,g} = 7'b1011111;
        7: {a,b,c,d,e,f,g} = 7'b1110000;
        8: {a,b,c,d,e,f,g} = 7'b1111111;
        9: {a,b,c,d,e,f,g} = 7'b1111011;
        default: {a,b,c,d,e,f,g} = 7'b0000000;
      endcase
    end
endmodule
        
        