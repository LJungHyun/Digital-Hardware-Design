module Decoder_Behavioral(out, in, en);
	output [3:0] out;									// 출력
	
	input [1:0] in; 									// 입력
	input en;											// 동작 신호
	reg [3:0] out;
	
	always @(in or en)
		begin
			case({in[1],in[0],en})					// 입력에 대한 Case 설정
			3'b001 : out = 4'b0001;					// 00에 대한 출력
			3'b011 : out = 4'b0010;					// 01에 대한 출력
			3'b101 : out = 4'b0100;					// 10에 대한 출력
			3'b111 : out = 4'b1000;					// 11에 대한 출력
			default : out = 1'bx;
			endcase
		end
		
endmodule 