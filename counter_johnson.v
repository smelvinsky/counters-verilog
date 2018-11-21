
/* 
 * Counter (Johnson code) Verilog example (iverilog 10.1)
 *
 */
 
 module counter
 (
     input clock,
     input reset,
     input up_down,
     output [2:0] out
 );

    reg [2:0] out_tmp;

    always @ (posedge(clock))
    begin
        if (reset)
            out_tmp = 0;
        else if (up_down == 1'b0)
            begin
            if (out_tmp != 3'b110)
                out_tmp <= {out_tmp[1:0], ~out_tmp[2]};
            else
                out_tmp <= 3'b000;
            end
        else
            begin
            if (out_tmp != 3'b000)
                out_tmp <= {~out_tmp[0], out_tmp[2:1]};
            else
                out_tmp <= 3'b110;
            end
    end

    assign out = out_tmp;

endmodule