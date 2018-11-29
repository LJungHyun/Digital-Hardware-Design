module test_Booth;
	reg  [15:0] a, b;  // 16-bit operands
	wire [31:0] result;
	reg  [31:0] check; // 16-bit value used to check
	integer    i, j;     // loop variables
	integer    num_correct; // counter to keep track of the number correct
	integer    num_wrong;   // counter to keep track of the number wrong

	// instantiate the 16-bit Multiplier
	BoothMultiplier booth(a, b, result); // 16-bit Multiplier

	// exhaustive checking
	initial begin    // initialize the counter variables
		num_correct = 0; num_wrong = 0;

		// loop through all possible cases and record the results
		for (i = 0; i < 32768; i = i + 100) begin
			a = i;
			for (j = 0; j < 32768; j = j + 100) begin
				b = j;
				check = a * b;                 

				#10 if (result == check)
					num_correct = num_correct + 1;
				else
					num_wrong = num_wrong + 1;     // following line is for debugging    
				$display($time, "  %d * %d = %d (%d)", a, b, result, check);
			end
		end     // print the final counter values   
		$display("num_correct = %d, num_wrong = %d", num_correct, num_wrong);
	end
endmodule
