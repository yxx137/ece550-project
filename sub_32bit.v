module sub_32bit(A, B, sum);
input [31:0] A,B;
output [31:0] sum;
wire[31:0] out;

genvar i;
	generate
		for(i = 0; i < 32; i=i+1) begin: n_xor
			//n_xor xor1(b[i], 1, out[i]);
			xor xor1(out[i], B[i], 1);
		end
	endgenerate
			 
				
	Adder_32bit Add_32bit1(A, out, 1'b1, sum);
	//assign data_result = out;
endmodule





