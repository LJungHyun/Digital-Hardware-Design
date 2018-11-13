module test_Shifter;
	reg lr;				// Left or Right
	reg [15:0] in; 	// input
	reg [3:0] shift;	//shift
	
	wire [15:0] out;	//output
	
	integer i;

	Shift_16bit shift0(shift, lr, in, out);
	
	initial begin
		for (i = 1; i < 3; i = i + 1) begin
			shift = i;	// shift 1 ~ 3
			lr = 1'b0; 	// Right
			in = 16'hff00;	// 1111 1111 0000 0000
			#100;
		end
		
		#200
		
		for (i = 1; i < 3; i = i + 1) begin
			shift = i;	//shift 1 ~ 3
			lr = 1'b1;	// Left
			in = 16'hff00;	// 1111 1111 0000 0000
			#100;
		end
		
		#200
		
		for (i = 1; i < 3; i = i + 1) begin
			shift = i;	// shift 1 ~ 3
			lr = 1'b0;	// Right
			in = 16'h00ff;	// 0000 0000 1111 1111
			#100;
		end
		
		#200
		
		for (i = 1; i < 3; i = i + 1) begin
			shift = i;	// shift 1 ~ 3
			lr = 1'b1;	// Left
			in = 16'h00ff;	// 0000 0000 1111 1111
			#100;
		end
	end
endmodule 