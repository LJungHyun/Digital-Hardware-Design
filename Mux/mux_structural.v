module mux_structural(out, in0, in1, in2, in3, sel);
	output out;										// 출력

	input in0, in1, in2, in3;					// 입력
	input [1:0] sel;								// 입력 선택
	
	wire notsel0, notsel1;						// 선택에 대한 번전 신호
	wire y0, y1, y2, y3;							//	출력

	not not0 (notsel0, sel[0]);					// 출력 신호 선택
	not not1 (notsel1, sel[1]);					// 출력 신호 선택
	and and0 (y0, in0, notsel1, notsel0);	// in0에 대한 신호 선택
	and and1 (y1, in1, notsel1, sel[0]);		// in1에 대한 신호 선택
	and and2 (y2, in2, sel[1], notsel0);		// in2에 대한 신호 선택
	and and3 (y3, in3, sel[1], sel[0]);			// in3에 대한 신호 선택
	or or0 (out, y0, y1, y2, y3);				// Or 연산을 통해 출력
	
endmodule 

