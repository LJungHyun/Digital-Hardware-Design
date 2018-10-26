module Test_FSM;
	reg nRESET; 				// 리셋
	reg clk;						// 클럭
	reg in; 						// 입력 신호
	wire out;					// 출력
	
	Mealy U0 
	(
		.nRESET(nRESET),
		.clk(clk),
		.in(in),
		.out(out)
	);
	
	always #50 clk = ~clk; // clock cycle은 200마다 상승 

	
	initial begin
		clk = 1'b1;
		nRESET = 1'b1;
		
		#100 in = 1'b0;
		#100 in = 1'b0;
		#100 in = 1'b1;
		
		#100 in = 1'b0;
		#100 in = 1'b0;
		#100 in = 1'b0;
		#100 in = 1'b0;
		
		#100 in = 1'b1;
		#100 in = 1'b1;
		#100 in = 1'b1;
		#100 in = 1'b1;
		#100 in = 1'b1;
		
		#100 in = 1'b0;
		#100 in = 1'b0;
		
		#100
		$finish;
	end
endmodule
