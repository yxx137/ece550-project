module ovfSub(A, B, sum, ovf);

 input [31:0] A, B, sum;
 output ovf;
 
 not n1(NA31, A[31]);
 not n2(NB31, B[31]); 
 not n3(NS31, sum[31]); 
 and and1(A1, A[31], NB31, NS31); 
 and and2(A2, NA31, B[31], sum[31]); 
 or or1(ovf, A1, A2);
 
endmodule
