module MUX_2to1(A, B, Sel, Out);

	input [31:0] A, B;
	input Sel;
	output [31:0] Out;

	assign Out = Sel ? A: B;
	
endmodule
