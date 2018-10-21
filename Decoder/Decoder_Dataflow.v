module Decoder_Dataflow(out, in, en);
	output [3:0] out;						 		// 출력
	
	input [1:0] in;								// 입력
	input en;										// 동작 신호
	
	assign out[0] = (~in[0] & ~in[1] & en); 	// 00에 대한 decoder 출력
	assign out[1] = (in[0] & ~in[1] & en); 		// 01에 대한 decoder 출력
	assign out[2] = (~in[0] & in[1] & en); 		// 10에 대한 decoder 출력
	assign out[3] = (in[0] & in[1] & en);		// 11에 대한 decoder 출력
	
endmodule 

