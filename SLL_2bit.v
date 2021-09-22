module SLL_2bit  (B, shift, out);
	input[31:0] B;
	input shift;
	output[31:0] out;
	
	genvar i;
	generate
		for (i=0; i<32; i=i+1) begin:mux
			if (i<2)
				assign out[i] = (shift == 0) ? B[i] : 0;
			else
				assign out[i] = (shift == 0) ? B[i] : B[i-2];
		end
	endgenerate
	
endmodule
