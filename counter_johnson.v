
/* 
 * Counter (Johnson code) Verilog example (iverilog 10.1)
 *
 */
 
 module counter
 (
     input clock,
     input reset,
     input up_down,
     output [3:0] out
 );

    reg [3:0] out_tmp;

    always @ (posedge(clock), reset)
    begin
        if (reset == 1'b1)
            out_tmp = 0;
        else if (up_down == 1'b1)
            out_tmp = {out_tmp[2:0], ~out_tmp[3]};
        else
            out_tmp = {~out_tmp[0], out_tmp[3:1]};
    end

    assign out = out_tmp;

endmodule