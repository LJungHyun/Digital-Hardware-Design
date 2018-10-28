module Test_FSM;
	reg nRESET; 				// Reset
	reg clk;						// CLK
	reg in; 						// Input
	wire out;					// Output
	
	Mealy U0 
	(
		.nRESET(nRESET),
		.clk(clk),
		.in(in),
		.out(out)
	);
	
	always #50 clk = ~clk; // 50동안 HIGH, 50동안 LOW 100 주기
	
	initial begin
		clk = 1'b1;
		nRESET = 1'b1;
		
		#100 in = 1'b0;		// 0
		#100 in = 1'b0;		// 0
		#100 in = 1'b1;		// 1
	
		#100 in = 1'b0;		// 0
		#100 in = 1'b0;		// 0
		#100 in = 1'b0;		// 0
		#100 in = 1'b0;		// 0
		
		#100 in = 1'b1;		// 1
		#100 in = 1'b1;		// 1
		#100 in = 1'b1;		// 1
		#100 in = 1'b1;		// 1
		#100 in = 1'b1;		// 1
		
		#100 in = 1'b0;		// 0 
		#100 in = 1'b0;		// 0
		
		#100
		$finish;
	end
endmodule
