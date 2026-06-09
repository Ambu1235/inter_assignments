module mux2_1(input [1:0]i,input s,output reg y

    );
    always @(*)
    begin
    case(s)
    0:y=i[0];
    1:y=i[1];
    default: y=0;
    endcase 
    end
endmodule
