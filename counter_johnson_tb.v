
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
    wire [2:0] Out;

    /* variables */
    integer i;

    /* instantiate the uut */
    counter uut(.clock(Clock), .reset(Reset), .up_down(Up_down), .out(Out));

    initial
    begin
        $display("Up/down Johnson's counter testbench...\n");
        $dumpfile("counter_1_test.vcd");
        $dumpvars;

        Up_down = 0;
        Clock = 1'b0;
        i = 0;
        Reset = 0;
        #10;
        Reset = 1;
        #5;
        Clock = 1'b1;
        #5;
        Reset = 0;
        Clock = 1'b0;
        #20;

        while (i < 20) begin
            if (i == 10) begin
                Up_down = 1;
                #10;
                $display("Up/Down change");
                end
            Clock = ~Clock; #10;
            Clock = ~Clock; #10;
            i = i + 1;
            $display("Counter out: %b\ttime = %d", Out, $time);
        end

        $display("Done...");
    end

endmodule
    