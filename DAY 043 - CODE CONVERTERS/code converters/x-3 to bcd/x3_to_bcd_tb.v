module x3_to_bcd_tb();
  reg [3:0]x;
  wire [3:0]b;
  
  x3_to_bcd xb(x,b);
  
  integer i;
  
  initial
    begin
      for(i=3; i<13; i=i+1)
        begin
          x = i;
          #10;
        end
      $finish;
    end
  initial
    $monitor("x=%b,b=%b",x,b);
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
endmodule