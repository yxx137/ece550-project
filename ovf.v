module ovf(A, B, sum, ovfl);

	input [31:0] A, B, sum;
	output ovfl;

	not n1(NA31, A[31]);
	not n2(NB31, B[31]); 
	not n3(NS31, sum[31]); 
	and and1(A1, NA31, NB31, sum[31]); 
	and and2(A2, A[31], B[31], NS31); 
	or or1(ovfl, A1, A2);
 
endmodule
