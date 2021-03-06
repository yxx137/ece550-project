module isLessThan_32bit (A, B, isLessThan);
	input[31:0] A, B;
	output isLessThan;
	wire[31:0] sub_out;
	wire overflowS;
	
	sub_32bit sub1(A, B, sub_out);
	ovfSub ovf(A, B, sub_out, overflowS);
	
	xor xor_significantout_overf(isLessThan, sub_out[31],overflowS);
	
endmodule
	

	
	
