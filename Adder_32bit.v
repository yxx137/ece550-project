module Adder_32bit (input[31:0] A,
							input[31:0] B,
							input c0,
							output [31:0] sum);
				wire cout1, cout2, cout3;
				wire[31:0] sum1;

RCA_16bit RCA1(A[15:0], B[15:0], c0, cout1, sum[15:0]);
RCA_16bit RCA2(A[31:16], B[31:16], 0, cout2, sum1[15:0]);
RCA_16bit RCA3(A[31:16], B[31:16], 1, cout3, sum1[31:16]);


assign sum[31:16] = (cout1 == 0) ? sum1[15:0] : sum1[31:16];

endmodule
