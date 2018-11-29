module CSA7_HA (a, b, cout, sum);
	input[6:0]a;
	input[6:0]b;
	output[6:0]cout, sum;
	
/* Adder Connection */
	HA hadd6(a[6],b[6],cout[6],sum[6]);
	HA hadd5(a[5],b[5],cout[5],sum[5]);
	HA hadd4(a[4],b[4],cout[4],sum[4]);
	HA hadd3(a[3],b[3],cout[3],sum[3]);
	HA hadd2(a[2],b[2],cout[2],sum[2]);
	HA hadd1(a[1],b[1],cout[1],sum[1]);
	HA hadd0(a[0],b[0],cout[0],sum[0]);
endmodule