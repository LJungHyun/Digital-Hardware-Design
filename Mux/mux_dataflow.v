module mux_dataflow(out, in0, in1, in2, in3, sel); 
	input in0, in1, in2, in3; 	// 입력
	input  [1:0] sel; 			// 출력 값 선택
	output out;						// 출력
	wire out;						// 출련 선
	
	assign out =
		(sel == 2'b00) ? in0 : 	// select가 00일 때 in0 출력
		(sel == 2'b01) ? in1 : 	// select가 01일 때 in1 출력
		(sel == 2'b10) ? in2 : 	// select가 10일 때 in2 출력
		(sel == 2'b11) ? in3 : 1'bx; // select가 11일 때 in3 출력
		
endmodule 