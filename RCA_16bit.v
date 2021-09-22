module RCA_16bit #(parameter Width = 16)
                    (input [Width-1:0] A,
                     input [Width-1:0] B,
							input Cin,
                     output Cout,
                     output [Width-1:0] Sum);
    
    wire Carry[Width:0];
    assign Carry[0] = Cin;
    assign Cout     = Carry[Width];
    
    generate
    genvar i;
    for(i = 0;i<Width;i = i+1)
        begin: gen_FA
        FA FAn(
        .A(A[i]),
        .B(B[i]),
        .Cin(Carry[i]),
        .Sum(Sum[i]),
        .Cout(Carry[i+1]));
    end
    endgenerate
    
endmodule