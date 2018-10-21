module test_decoder;
	reg [1:0] in;
	reg en;
	wire [3:0] out;
	
	Decoder_Behavioral U0(out, in, en); 

	initial begin
		#100
		in = 2'b00; en = 1'b1;		// 입력 00 en on 
		#100 
		in = 2'b01; en = 1'b1;		// 입력 01 en on 
		#100 
		in = 2'b10; en = 1'b1;		// 입력 10 en on 
		#100 
		in = 2'b11; en = 1'b1;		// 입력 11 en on 
		#100
		in = 2'b00; en = 1'b0;		// 입력 00 en off 
		#100
		
		$finish; // 종료
	end
endmodule
