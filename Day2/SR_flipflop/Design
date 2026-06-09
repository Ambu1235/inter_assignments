`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 16:37:48
// Design Name: 
// Module Name: srff
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module sr_flip_flop (
    input clk,
    input s,
    input r,
    output reg q
);

always @(posedge clk)
begin
    case ({s,r})
        2'b00: q <= q;     
        2'b01: q <= 1'b0;   
        2'b10: q <= 1'b1;   
        2'b11: q <= 1'bx;   
    endcase
end

endmodule
