module test_mux;
	reg in0;
	reg in1;
	reg in2;
	reg in3;
	reg [1:0] sel; 
	wire out;
	
	mux_structural U0(out, in0, in1, in2, in3, sel); 
	
	initial begin
		#100
		sel = 2'b00;
		in0 = 1'b1; in1 = 1'b0; in2 = 1'b0; in3 = 1'b0;
		
		#100 
		sel = 2'b01;
		in0 = 1'b0; in1 = 1'b1; in2 = 1'b0; in3 = 1'b0;
		
		#100 
		sel = 2'b10;
		in0 = 1'b0; in1 = 1'b0; in2 = 1'b0; in3 = 1'b1;
		
		#100 
		sel = 2'b11;
		in0 = 1'b0; in1 = 1'b0; in2 = 1'b0; in3 = 1'b1;
		
		#100 
		$finish;
	end
endmodule
