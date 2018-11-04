module KoggeTest;
	reg  [15:0] a, b;  // 8-bit operands
	reg  c0;          // carry input
	wire [15:0] s;     // 8-bit sum output
	wire c16;          // carry output
	reg  [16:0] check; // 9-bit value used to check
	integer    i, j,k;     // loop variables
	integer    num_correct; // counter to keep track of the number correct
	integer    num_wrong;   // counter to keep track of the number wrong

	// instantiate the 8-bit Kogge-Stone adder
	KoggeStoneAdder ks1(a, b, c0, c16, s);

	// exhaustive checking
	initial begin    // initialize the counter variables
		num_correct = 0; num_wrong = 0;

		// loop through all possible cases and record the results
		for (i = 0; i < 65536; i = i + 100) begin
			a = i;
			for (j = 0; j < 65536; j = j + 100) begin
				b = j;
				for (k = 0; k < 2; k = k + 1) begin
					c0 = k;// c0=0 for add, c0=1 for sub
					check = a + b + c0;                 

					#10 if ({c16, s} == check)
						num_correct = num_correct + 1;
					else
						num_wrong = num_wrong + 1;     // following line is for debugging    
					$display($time, "  %d + %d + %d = %d (%d)", a, b, c0, {c16, s}, check);
				end
			end
		end     // print the final counter values   
		$display("num_correct = %d, num_wrong = %d", num_correct, num_wrong);
	end
endmodule