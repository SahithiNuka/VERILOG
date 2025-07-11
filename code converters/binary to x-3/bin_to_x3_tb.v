module bin_to_x3_tb();
  reg [3:0]b;
  wire [3:0]x;
  
  bin_to_x3 bx(b,x);
  
  integer i;
  
  initial
    begin
      for(i=0; i<13; i=i+1)
        begin
          b = i;
          #10;
        end
      $finish;
    end
  initial
    $monitor("b=%b,x=%b",b,x);
  
endmodule