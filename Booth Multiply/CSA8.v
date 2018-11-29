module CSA8 (a, b, c, cout, sum);
	input[7:0]	a;
	input[7:0]	b;
	input[7:0]	c;
	
	output[7:0]	cout, sum;
/* Adder Connection */
	FA fadd7(a[7],b[7],c[7],cout[7],sum[7]);
	FA fadd6(a[6],b[6],c[6],cout[6],sum[6]);
	FA fadd5(a[5],b[5],c[5],cout[5],sum[5]);
	FA fadd4(a[4],b[4],c[4],cout[4],sum[4]);
	FA fadd3(a[3],b[3],c[3],cout[3],sum[3]);
	FA fadd2(a[2],b[2],c[2],cout[2],sum[2]);
	FA fadd1(a[1],b[1],c[1],cout[1],sum[1]);
	FA fadd0(a[0],b[0],c[0],cout[0],sum[0]);
endmodule
