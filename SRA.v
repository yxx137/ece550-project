module SRA(A, shiftamt, out);
	input [31:0] A;
	input [4:0] shiftamt;
	output [31:0] out; 
	
	wire [31:0] sra16, mux16, sra8, mux8, sra4, mux4, sra2, mux2, sra1;
	
	SRA_16bit s4(A, sra16);
	MUX_2to1 m0(A, sra16, shiftamt[4], mux16);
	
	SRA_8bit s3(mux16, sra8);
	MUX_2to1 m1(mux16, sra8, shiftamt[3], mux8);
	
	SRA_4bit s2(mux8, sra4);
	MUX_2to1 m3(mux8, sra4, shiftamt[2], mux4);
	
	SRA_2bit s1(mux4, sra2);
	MUX_2to1 m4(mux4, sra2, shiftamt[1], mux2);
	
	SRA_1bit s0(mux2, sra1);
	MUX_2to1 m5(mux2, sra1, shiftamt[0], out);

endmodule
