module test_ALU16;
	reg [15:0] valA, valB;
	reg [3:0] aluop;
	reg sub;
	reg shift_Dir;
	reg rotator_Dir;
	wire [3:0] cc;
	wire [15:0] result;

	ALU16 myALU16(valA, valB, aluop, shift_Dir,rotator_Dir, sub, cc, result);
	
	initial begin
		
		#200
		aluop = 4'd0;		// Add
		valA = 16'd10;
		valB = 16'd20;
		sub = 0;
		
		#200
		valA = 16'd32767;	// Add OV
		valB = 16'd1;
		
		#200
		aluop = 4'b0001;	// Sub
		valA = 16'd20;
		valB = 16'd10;
		sub = 1;
		
		#200
		valA = 16'd10;		// Sub Neg
		valB = 16'd20;
		sub = 1;
		
		#200
		valA = 16'd10;		// Sub Zero
		valB = 16'd10;
		sub = 1;
		
		#200
		aluop = 4'd2;		// Shift Left
		valA = 16'b11;
		valB = 16'd4;
		shift_Dir = 2'b1;	// Left
		sub = 0;
		
		#200
		valA = 16'd49152;	// Shift Left OV
		valB = 16'd4;
		shift_Dir = 2'b1;	// Left
		
		#200
		aluop = 4'd3;
		valA = 16'b11;	// Ar Left
		valB = 16'd4;
		shift_Dir = 2'b1;
		
		#200
		valA = 16'd49152;	// Ar Left OV
		valB = 16'd4;
		shift_Dir = 2'b1;
	
		#200
		valA = 16'd49152;	// Ar Right
		valB = 16'd4;
		shift_Dir = 2'b0;
		
		#200
		valA = 16'b11;	// Ar Right Zero
		valB = 16'd4;
		shift_Dir = 2'b0;		
		
		#200
		aluop = 4'd4;
		valA = 16'b11;	// Lo Left
		valB = 16'd4;
		shift_Dir = 2'b1;
		
		#200
		valA = 16'd49152;	// Lo Left OV
		valB = 16'd4;
		shift_Dir = 2'b1;
		
		#200
		valA = 16'd49152;	// Lo Right
		valB = 16'd4;
		shift_Dir = 2'b0;
		
		#200
		valA = 16'b11;	// Lo Right Zero
		valB = 16'd4;
		shift_Dir = 2'b0;
		
		#200
		aluop = 4'd5;
		valA = 16'd49152;	// Rotator Left
		valB = 16'd4;
		rotator_Dir = 2'b1;
		
		#200
		aluop = 4'd6;
		valA = 16'b11;	// Rotator Right
		valB = 16'd4;
		rotator_Dir = 2'b0;
		
		#200
		aluop = 4'd7;		// Mul
		valA = 16'd10;
		valB = 16'd202;
		sub = 0;
		
		#200
		valA = 16'd10000;	// Mul OV
		valB = 16'd10000;
		
		#200
		valA = 16'd10;		// Mul Zero
		valB = 16'd0;
		
		#200
		valA = 16'd32768;		// Mul Neg
		valB = 16'd2;
	
		#200
		aluop = 4'd8;		// And
		valA = 16'b1010;
		valB = 16'b1100;
		sub = 0;

		#200
		aluop = 4'd9;		// Or
		valA = 16'b1010;
		valB = 16'b1100;
		sub = 0;
		
		#200
		aluop = 4'd10;		// Not
		valA = 16'bx;
		valB = 16'b1100;
		sub = 0;
		
		#200
		aluop = 4'd11;		// Xor
		valA = 16'b1010;
		valB = 16'b1100;
		sub = 0;
		#200
		
		$finish;
	end

endmodule 