module AND_32bit (A, B, out);
	input[31:0] A, B;
	output[31:0] out;
	
	
	genvar i;
	generate
	for (i=0; i<32; i=i+1) begin:gene_or
		and and1(out[i], A[i], B[i]);
	end
	endgenerate
	
endmodule
