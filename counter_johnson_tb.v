
/* 
 * Counter (Johnson code) Verilog example tesbench (iverilog 10.1)
 *
 */

`timescale 1ns/1ps

`include "counter_johnson.v"
 
 module counter_johnson_tb;

    /* inputs */
    reg Clock;
    reg Up_down;
    reg Reset;

    /* outputs */
    wire [3:0] Out;

    /* variables */
    integer i;

    /* instantiate the uut */
    counter uut(.clock(Clock), .reset(Reset), .up_down(Up_down), .out(Out));

    initial
    begin
        $display("Up/down Johnson's counter testbench...\n");
        $dumpfile("counter_1_test.vcd");
        $dumpvars;

        Clock = 1'b0;
        i = 0;
        Up_down = 0;
        Reset = 0;
        #10;
        Reset = 1;
        #5;
        Reset = 0;
        #20;

        while (i < 64) begin
            if (i == 32) begin
                Up_down = 1;
                $display("Up/Down change");
                end
            #10;
            Clock = ~Clock;
            i = i + 1;
            $display("Counter out: %b\ttime = %d", Out, $time);
        end

        $display("Done...");
    end

endmodule
    