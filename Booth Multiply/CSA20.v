// 20bit Carry Propagate Adder
module CSA20 (a, b, c, cout, sum);
	input[19:0]	a;
	input[19:0]	b;
	input[19:0]	c;
	
	output[19:0]	cout, sum;
	
/* Adder Connection */
	FA fadd19(a[19],b[19],c[19],cout[19],sum[19]);
	FA fadd18(a[18],b[18],c[18],cout[18],sum[18]);
	FA fadd17(a[17],b[17],c[17],cout[17],sum[17]);
	FA fadd16(a[16],b[16],c[16],cout[16],sum[16]);
	FA fadd15(a[15],b[15],c[15],cout[15],sum[15]);
	FA fadd14(a[14],b[14],c[14],cout[14],sum[14]);
	FA fadd13(a[13],b[13],c[13],cout[13],sum[13]);
	FA fadd12(a[12],b[12],c[12],cout[12],sum[12]);
	FA fadd11(a[11],b[11],c[11],cout[11],sum[11]);
	FA fadd10(a[10],b[10],c[10],cout[10],sum[10]);
	FA fadd9(a[9],b[9],c[9],cout[9],sum[9]);
	FA fadd8(a[8],b[8],c[8],cout[8],sum[8]);
	FA fadd7(a[7],b[7],c[7],cout[7],sum[7]);
	FA fadd6(a[6],b[6],c[6],cout[6],sum[6]);
	FA fadd5(a[5],b[5],c[5],cout[5],sum[5]);
	FA fadd4(a[4],b[4],c[4],cout[4],sum[4]);
	FA fadd3(a[3],b[3],c[3],cout[3],sum[3]);
	FA fadd2(a[2],b[2],c[2],cout[2],sum[2]);
	FA fadd1(a[1],b[1],c[1],cout[1],sum[1]);
	FA fadd0(a[0],b[0],c[0],cout[0],sum[0]);
endmodule