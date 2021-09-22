# ALU
#Xinxin Ye xy137
#Iris Zhang mz197

*************************First Check Point*************************
We decide to use 3x 16-bit RCA 
with one 32-bit Mux to built a 32-bit adder. 

32-bit subtract: 32-bit input(A)  substract 32-bit input(B)
                       using 32 xor, with a 32-bit adder.

#FA.v 
A simple full adder.

#RCA_16bit
A 16 bit ripple carry adder.

#Adder_32bit
Using three 16-bit RCA. One is for higher bits and two for lower bit. The two lower bit RCAs are using signed carry in, 0/1 to process carry in bit.

#Sub_32bit
Convert the minus input B as plus negative input B. And then use the adder_32bit.

#ovf
Logic:  
A/B    S
0 0     1
1 1     0

#ovfSub
A/B    S
1 0     0
0 1     1

We split overflow into addition/subtraction. And check them separately.


*************************Second Check Point*************************
#MUX_2to.v
A 32 bit 2 to 1 multiplexer.

#SLL:
#SLL_1bit.v
32-bit number shifted left by a 1 bit number with 32 2 to 1 mux.

#SLL_2bit.v
32-bit number shifted left by a 2 bit number with 32 2 to 1 mux.

#SLL_4bit.v
32-bit number shifted left by a 4 bit number with 32 2 to 1 mux.

#SLL_8bit.v
32-bit number shifted left by a 8 bit number with 32 2 to 1 mux.

#SLL_16bit.v
32-bit number shifted left by a 16 bit number with 32 2 to 1 mux.

#SLL_31bit.v
32-bit number shifted left by 0-31 with 32* 5 2 to 1 mux.

# SRA 
For SRA, we avoid the inner 32 MUXes, instead, we shift bits by how the shifte does. 

#SRA_1bit.v
Every bit except the least significant bit is pushed one bit to the right as output. 
And copy the most significant bit of the input to the most significant bit of the output. 

#SRA_2bit.v
Every bit except 2 bits on the far right is pushed 2 bits to the right as output. 
And copy the most significant bit of the input to 2 bit on the far left of the output. 

#SRA_4bit.v
Every bit except 4 bits on the far right is pushed 4 bits to the right as output. 
And copy the most significant bit of the input to 4 bit on the far lef of the output. 

#SRA_8bit.v
Every bit except 8 bits on the far right is pushed 8 bits to the right as output. 
And copy the most significant bit of the input to 8 bit on the far left of the output. 

#SRA_16bit.v
Every bit except 16 bits on the far right is pushed 16 bits to the right as output. 
And copy the most significant bit of the input to 16 bit on the far left of the output. 


For SLL and SRA, we both uses the 2-to-1 MUX to determine the shift.[Barral Shifter]
Opcode bit:

        S4                      S3                      S2                   S1                     S0
    shift by 0/16           shift by 0/8            shift by 0/4         shift by 0/2           shift by 0/1

#isNotEqual_32bit
I used 32 xor gates to compare data_operandA, data_operandB and get a compare_result. 
we use loop to manipulate 32 bit compare_result by or gates one bit by one bit.

#isLessThan_32bit
We compared the most significant bit of the value after subtracting data_operandA and data_operandB with overflow.
the most significant bit            overflow         isLessThan
0                                   1                 1
1                                   0                 1
			