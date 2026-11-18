
`timescale 1ns/1ps

module vending_machine_tb;

    reg clk;
    reg reset;
    reg coin5;
    reg coin10;

    wire dispense;
    wire change5;


    vending_machine uut(
        .clk(clk),
        .reset(reset),
        .coin5(coin5),
        .coin10(coin10),
        .dispense(dispense),
        .change5(change5)
    );

    always #5 clk = ~clk;

    initial
    begin

        clk = 0;
        reset = 1;
        coin5 = 0;
        coin10 = 0;

        #10 reset = 0;

    
        #10 coin5 = 1;
        #10 coin5 = 0;

        #10 coin10 = 1;
        #10 coin10 = 0;

        #20;

    
        reset = 1;
        #10 reset = 0;

        #10 coin10 = 1;
        #10 coin10 = 0;

        #10 coin5 = 1;
        #10 coin5 = 0;

        #20;

    
        reset = 1;
        #10 reset = 0;

        #10 coin5 = 1;
        #10 coin5 = 0;

        #10 coin5 = 1;
        #10 coin5 = 0;

        #10 coin5 = 1;
        #10 coin5 = 0;

        #20;

        $finish;

    end


    initial
    begin
        $monitor("Time=%0t Reset=%b Coin5=%b Coin10=%b Dispense=%b Change=%b",
                 $time, reset, coin5, coin10,
                 dispense, change5);
    end

endmodule
