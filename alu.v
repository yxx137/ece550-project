
module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;
	wire[31:0] sub_result, add_result, and_32bit_result, or_32_bit_result, sll_shift_result, sra_shift_result;
	wire overflowS, overflowA;

	
	sub_32bit sub1(data_operandA, data_operandB, sub_result);
	ovfSub ov(data_operandA, data_operandB, sub_result, overflowS);
	
	Adder_32bit adder1(data_operandA, data_operandB, 0, add_result);
	ovf ov1(data_operandA, data_operandB, add_result, overflowA);
	
	AND_32bit and32bit(data_operandA, data_operandB, and_32bit_result);
	
	OR_32bit or32bit(data_operandA, data_operandB, or_32_bit_result);
	
	SLL_31bit sll31bit(data_operandA, ctrl_shiftamt, sll_shift_result);
	
	SRA sra31bit(data_operandA, ctrl_shiftamt, sra_shift_result);
	
	isNotEqual_32bit isnotequal(data_operandA, data_operandB, isNotEqual);
	isLessThan_32bit islessthan(data_operandA, data_operandB, isLessThan);
	assign overflow = (ctrl_ALUopcode[0] == 1) ? overflowS : overflowA;
	
	assign data_result=
		
		ctrl_ALUopcode[4] == 1 ? 32'h00000000 :
			ctrl_ALUopcode[3] == 1 ? 32'h00000000 :
				ctrl_ALUopcode[2] == 1? (
					// 1xx
					ctrl_ALUopcode[1] == 1? 32'h00000000: (
						ctrl_ALUopcode[0] == 1? sra_shift_result : sll_shift_result
					)
				) : ( 
					// 0xx
					ctrl_ALUopcode[1] == 1? (
						// 01x
						ctrl_ALUopcode[0] == 1? or_32_bit_result : and_32bit_result
					) : (
						// 00x
						ctrl_ALUopcode[0] == 1? sub_result : add_result
					)
					
				);
				
				
	 
	
endmodule
	
	
	
	
	
	
	
	
	