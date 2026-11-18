`timescale 1ns/1ps

module vending_machine(
    input clk,
    input reset,
    input coin5,
    input coin10,
    output reg dispense,
    output reg change5
);

    
    parameter S0  = 2'b00,
              S5  = 2'b01,
              S10 = 2'b10,
              S15 = 2'b11;

    reg [1:0] state, next_state;

    
    always @(posedge clk or posedge reset)
    begin
        if(reset)
            state <= S0;
        else
            state <= next_state;
    end

    
    always @(*)
    begin
        next_state = state;

        case(state)

            S0:
            begin
                if(coin5)
                    next_state = S5;
                else if(coin10)
                    next_state = S10;
            end

            S5:
            begin
                if(coin5)
                    next_state = S10;
                else if(coin10)
                    next_state = S15;
            end

            S10:
            begin
                if(coin5 || coin10)
                    next_state = S15;
            end

            S15:
                next_state = S0;

            default:
                next_state = S0;

        endcase
    end

    
    always @(*)
    begin
        dispense = 0;
        change5 = 0;

        if(state == S15)
        begin
            dispense = 1;

         
            if(coin10)
                change5 = 1;
        end
    end

endmodule
