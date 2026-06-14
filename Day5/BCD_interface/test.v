
`timescale 1ns / 1ps

interface adder;
logic [3:0]a,b,sum;
logic cin,carry;
endinterface

module BCD_tb2();

adder adinf();
bcd_adder dut(adinf.a,adinf.b,adinf.cin,adinf.sum,adinf.carry);
initial 
begin
  {adinf.a, adinf.b,adinf.cin} = 0;
end

initial 
begin
#10;
adinf.a=4'b0100;
adinf.b=4'b0011;
adinf.cin=1'b0;
#10;


adinf.a=4'b0101;
adinf.b=4'b0110;
adinf.cin=1'b0;

#10;

end
endmodule
