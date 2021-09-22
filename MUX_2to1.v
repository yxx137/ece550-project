//module MUX_2to1(Out, Sel, A, B);
//
//	input [31:0] A, B;
//	input Sel;
//	output [31:0] Out;
//
//	assign Out = Sel ? A: B;
//	
//endmodule


module MUX_2to1(in0, in1, select, out);
    input select;
    input [31:0] in0, in1;
    output [31:0] out;
    assign out = select ? in1: in0;
endmodule
