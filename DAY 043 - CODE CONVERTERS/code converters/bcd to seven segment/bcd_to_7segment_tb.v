
module bcd_to_7segment_tb();
  reg [3:0]bcd;
  wire a,b,c,d,e,f,g;
  
  integer i;
  
  bcd_to_7segment b1(bcd,a,b,c,d,e,f,g);
  
  initial
    begin
      for(i=0; i<10; i=i+1)
        begin
          bcd = i;
          #10;
        end
      $finish;
    end
  initial
    $monitor("bcd=%d,a=%b,b=%b,c=%b,d=%b,e=%b,f=%b,g=%b", bcd,a,b,c,d,e,f,g);
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
endmodule