module FA(a, b, c, cout, sum);
	input	a, b, c;
	output cout, sum;

	assign {cout,sum} = a + b + c;
	
endmodule