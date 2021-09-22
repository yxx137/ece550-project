module SLL_31bit(B, shift, out);
	input[31:0] B;
	input[4:0] shift;
	output[31:0] out;
	wire[31:0] output_shift1bit;
	wire[31:0] output_shift3bit;
	wire[31:0] output_shift7bit;
	wire[31:0] output_shift15bit;
	
SLL_1bit sll1(B[31:0], shift[0], output_shift1bit[31:0]);
SLL_2bit sll2(output_shift1bit[31:0], shift[1], output_shift3bit[31:0]);
SLL_4bit sll4(output_shift3bit[31:0], shift[2], output_shift7bit[31:0]);
SLL_8bit sll8(output_shift7bit[31:0], shift[3], output_shift15bit[31:0]);
SLL_16bit sll16(output_shift15bit[31:0], shift[4], out[31:0]);



//SLL_1bit sll2(output_shift1bit[31:0], shift[1], output_shift3bit[31:0]);
//SLL_1bit sll3(output_shift3bit[31:0], shift[2], output_shift7bit[31:0]);
//SLL_1bit sll4(output_shift7bit[31:0], shift[3], output_shift15bit[31:0]);
//SLL_1bit sll5(output_shift15bit[31:0], shift[4], out[31:0]);

	
endmodule
