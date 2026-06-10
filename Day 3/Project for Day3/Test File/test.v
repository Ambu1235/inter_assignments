`timescale 1ns / 1ps

module top_tb;

    reg clk;
    reg rst;
    reg sin;
    wire dout;

    top uut (
        .clk(clk),
        .rst(rst),
        .sin(sin),
        .dout(dout)
    );

    always #5 clk = ~clk;

    task send_bit;
        input bit_value;
        begin
            @(negedge clk);
            sin = bit_value;
        end
    endtask

    initial begin
        clk = 1'b0;
        rst = 1'b1;
        sin = 1'b0;

        #12;
        rst = 1'b0;

        // Example bit stream containing 1011 patterns
        send_bit(1'b1);
        send_bit(1'b0);
        send_bit(1'b1);
        send_bit(1'b1);
        send_bit(1'b0);
        send_bit(1'b1);
        send_bit(1'b1);
        send_bit(1'b0);
        send_bit(1'b1);
        send_bit(1'b1);
        send_bit(1'b0);
        send_bit(1'b1);
        send_bit(1'b1);

        #40;
        $finish;
    end

endmodule
