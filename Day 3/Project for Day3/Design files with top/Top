`timescale 1ns / 1ps

module top(
    input  wire clk,
    input  wire rst,
    input  wire sin,
    output wire dout
);

    wire [7:0] sout;
    wire [7:0] fifo_dout;
    wire       full;
    wire       empty;

    reg  [1:0] delay_cnt;
    reg        rdenb;

    wire wrenb;
    assign wrenb = ~rst;

    input_module u_input (
        .clk(clk),
        .sin(sin),
        .sout(sout)
    );

    fifo2 u_fifo (
        .clk(clk),
        .rst(rst),
        .wrenb(wrenb),
        .rdenb(rdenb),
        .data_in(sout),
        .data_out(fifo_dout),
        .full(full),
        .empty(empty)
    );

    output_fsm u_output (
        .clk(clk),
        .din(fifo_dout),
        .dout(dout)
    );

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            delay_cnt <= 2'd0;
            rdenb     <= 1'b0;
        end
        else begin
            if (delay_cnt < 2'd3) begin
                delay_cnt <= delay_cnt + 2'd1;
                rdenb     <= 1'b0;
            end
            else begin
                rdenb     <= 1'b1;
            end
        end
    end

endmodule
