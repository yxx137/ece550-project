module SLL_1bit  (B, shift, out);
	input[31:0] B;
	input shift;
	output[31:0] out;
	
	
	
	genvar i;
	generate
	for (i=1; i<32; i=i+1) begin:mux
		assign out[i]=(shift== 0) ? B[i] : B[i-1];
	end
	endgenerate
	
	assign out[0]= (shift == 0) ? B[0] : 0;
	
endmodule
