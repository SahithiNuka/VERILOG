
module bin_to_bcd_tb();
  reg [3:0]bin;
  wire [4:0]bcd;
  
  bin_to_bcd b1(bin,bcd);
  integer i;
  
  initial
    begin
      for(i=0; i<16; i=i+1)
        begin
          bin = i;
          #10;
        end
      $finish;
    end
  initial
    $monitor("bin=%b,bcd=%b",bin,bcd);
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
endmodule
