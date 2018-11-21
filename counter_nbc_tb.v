
/* 
 * Counter (weird NBC) Verilog example tesbench (iverilog 10.1)
 *
 */

`timescale 1ns/1ps

`include "counter_nbc.v"
 
 module counter_ncb_tb;

    /* inputs */
    reg Clock;
    reg Reset;

    /* outputs */
    wire [1:0] Out;

    /* variables */
    integer i;

    /* instantiate the uut */
    counter uut(.clock(Clock), .reset(Reset), .out(Out));

    initial
    begin
        $display("Counter testbench...\n");
        $dumpfile("counter_2_test.vcd");
        $dumpvars;

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
            Clock = ~Clock; #10;
            Clock = ~Clock; #10;
            i = i + 1;
            $display("Counter out: 0b%b\ttime = %d", Out, $time);
        end

        $display("Done...");
    end

endmodule
    