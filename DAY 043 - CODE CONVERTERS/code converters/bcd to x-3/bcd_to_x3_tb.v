
module bcd_to_x3_tb();
  reg [3:0]bcd;
  wire [3:0]x;
  
  integer i;
  
  bcd_to_x3 b1(bcd,x);
  
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
    $monitor("bcd=%b,x3=%b",bcd,x);
    
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
endmodule
  