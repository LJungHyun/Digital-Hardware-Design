module mux_behavioral(out, in0, in1, in2, in3, sel);
	input in0, in1, in2, in3; 					// 입력
	input [1:0] sel; 							// 출력
	output out;										// 출력
	reg out;
	
	always @(in0 or in1 or in2 or in3 or sel) 
		begin 
			case ({sel})					// Sel에 대한 Case 설정
			2'b00 : out = in0;					// Sel 00 일때 in0 출력
			2'b01 : out = in1;					// Sel 01 일때 in1 출력
			2'b10 : out = in2;					// Sel 10 일때 in2 출력
			2'b11 : out = in3;					// Sel 11 일때 in3 출력
			default : out = 1'bx;
			endcase
		end 
endmodule 