module armstrong_tb;

    reg  [9:0] num;
    wire is_armstrong; 

    armstrong_checker Armstrong(num, is_armstrong);

    initial begin
        $display("\nTime | Number | Armstrong?");
        $monitor("%t, %d, is_armstrong:%b", $time, num, is_armstrong);

        num = 153; #10;   
        num = 370; #10;   
        num = 371; #10;   
        num = 407; #10;   
        num = 200; #10;   
        num = 0;   #10;

        $finish;
    end

endmodule
