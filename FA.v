module FA (A, B, Cin, Sum, Cout);
 input A, B, Cin;
 output Sum, Cout;
 wire S1, T1, T2;
 
 xor
 X1 (S1, A, B),
 X2 (Sum, S1, Cin);
 
 and
 A1 (T1, S1, Cin),
 A2 (T2, A, B);
 
 or
 O1 (Cout, T1, T2);
endmodule
