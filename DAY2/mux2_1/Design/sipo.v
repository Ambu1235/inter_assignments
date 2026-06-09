module sipo(input clk,rst,sin,enb, output reg [3:0]p

    );
    reg [3:0]temp;
    always @(posedge clk)
    begin
    if (rst) begin
    temp<=4'b0000;
    end
    else if(enb==0) begin
    temp<=temp>>1'b1;
    temp[3]<=sin;
    end
    else if(enb==1) begin
    p<=temp;
    end
    
    
    end
endmodule

