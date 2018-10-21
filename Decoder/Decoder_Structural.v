module Decoder_Structural(out, in, en);
	output [3:0] out;					// 출력
	
	input [1:0] in;					// 입력
	input en;							// 동작 신호
	
	wire notin0, notin1;				// 입력에 대한 반전
	
	not not0 (notin0, in[0]);		// 입력 0에 대한 반전
	not not1 (notin1, in[1]);		// 입력 1에 대한 반전

	and and0 (out[0], notin0, notin1, en);		// 00에 대한 decoder 출력
	and and1 (out[1], in[0], notin1, en);		// 01에 대한 decoder 출력
	and and2 (out[2], notin0, in[1], en);		// 10에 대한 decoder 출력
	and and3 (out[3], in[0], in[1], en);		// 11에 대한 decoder 출력
	
endmodule 

