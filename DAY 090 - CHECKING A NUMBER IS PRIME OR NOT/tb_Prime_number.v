module tb_Prime_number;

    reg  [7:0] number;
    wire is_prime;

    Prime_number pm(number,is_prime);

    initial begin
        number = 0;    #10;
        number = 1;    #10;
        number = 2;    #10;
        number = 3;    #10;
        number = 4;    #10;
        number = 5;    #10;
        number = 17;   #10;
        number = 18;   #10;
        number = 19;   #10;
        number = 20;   #10;
        number = 97;   #10;
        number = 100;  #10;
        $finish;
    end

    initial
        $monitor("Time=%0t, number=%0d, is_prime=%0b",$time, number, is_prime);

endmodule
