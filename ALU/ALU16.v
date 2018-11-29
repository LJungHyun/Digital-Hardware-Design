module ALU16 (valA, valB, aluop, shift_Dir, rotator_Dir, sub, cc, result);

	input [15:0] valA;
	input [15:0] valB;
	input [ 3:0] aluop;
	input          sub;
	input shift_Dir;
	input rotator_Dir;
	
	output [ 3:0] cc;
	output [15:0] result;
	
	wire [15:0] and16b, or16b, add_out, svalB, result;
	wire [15:0] Ar_out, Lo_out, rotator_out, Mul_out, not16b, xor16b;
	
	wire shift_co, add_co, mul_co;
	wire shift_ov_Lo, shift_ov_Ar;
	wire [3:0] cc;
	
	wire N,Z,C,V;
	
	assign and16b = valA & valB;																// and 연산
	assign or16b = valA | valB;																// or 연산
	assign not16b = ~valB;																		// not 연산
	assign xor16b = valA ^ valB;																// xor 연산

	Shift_16bit_Ar myShifterAr (valB, shift_Dir, valA, shift_ov_Lo, Ar_out);	// Arthmetic Shift
	Shift_16bit_Lo myShifterLo (valB, shift_Dir, valA, shift_ov_Ar, Lo_out);	// Logical Shift
	
	Rotator_16bit myRotator (valB, rotator_Dir, valA, rotator_out);// Rotator
	
	assign svalB = sub ? ~valB : valB;
	KoggeStoneAdder myAdder(valA, svalB, sub, add_co, add_out);						// Add 연산
	
	BoothMultiplier myBooth (valA, valB, Mul_out, mul_co);							// Mul 연산
	
	assign result =
		(aluop == 4'd0) ? add_out :														// Add 결과
		(aluop == 4'd1) ? add_out :														// Sub 결과
		(aluop == 4'd2) ? Lo_out :															// Shift 결과
		(aluop == 4'd3) ? Ar_out :															// Arthemetic shift 결과
		(aluop == 4'd4) ? Lo_out :															// Logical Shift 결과
		(aluop == 4'd5) ? rotator_out :													// Rotator Left 결과
		(aluop == 4'd6) ? rotator_out :													// Rotator Right 결과
		(aluop == 4'd7) ? Mul_out :														// Mul 결과
		(aluop == 4'd8) ? and16b :															// And 결과
		(aluop == 4'd9) ? or16b :															// Or 결과
		(aluop == 4'd10) ? not16b :														// Not 결과
		(aluop == 4'd11) ? xor16b : 16'bx;												// Xor 결과
		
	assign N = result[15];																	// 음수 확인
	assign Z = ~|result;																		// Zero 확인
	assign C =	(aluop==4'd0) ? add_co :												// Carry 발생 확인
					(aluop==4'd7) ? mul_co : 1'b0;										// Carry 발생 확인
	assign V =  (aluop == 4'd2/*SHIFT*/) ? shift_ov_Lo :							// Shift OV 확인
					(aluop == 4'd4) ? shift_ov_Ar :										// Shift OV 확인
					(aluop == 4'd0/*ADD*/) ? (~valA[15] & ~svalB[15] & add_out[15]) | (valA[15] & svalB[15] & ~add_out[15]) : 1'b0; // Add OV 확인
	assign cc = {N,Z,C,V};
	
endmodule