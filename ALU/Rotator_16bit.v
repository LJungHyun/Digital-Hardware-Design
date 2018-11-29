module Rotator_16bit (shift, lr, in, out);
	output[15:0]out;								//	 output
	
	input[3:0]shift;								// shift size
	input lr;										// left or right
	input[15:0]in;
	
	wire[15:0]ta;
	wire[15:0]tb;
	wire[15:0]tc;
	wire[15:0]td;

	
	// left or right shift 
	assign ta = shift[0] ? (lr ? {in[14:0], in[15]} : {in[0], in[15:1]}) : in; // shift[0] == 1일때 이동(Ir에 따라 left or Right)
	assign tb = shift[1] ? (lr ? {ta[13:0], ta[15:14]} : {ta[1:0], ta[15:2]}) : ta; // shift[1] == 1일때 이동(Ir에 따라 left or Right)
	assign tc = shift[2] ? (lr ? {tb[11:0], tb[15:12]} : {tb[3:0], tb[15:4]}) : tb; // shift[2] == 1일때 이동(Ir에 따라 left or Right)
	assign td = shift[3] ? (lr ? {tc[7:0], tc[15:8]} : {tb[7:0], tc[15:8]}) : tc; // shift[3] == 1일때 이동(Ir에 따라 left or Right)
	// Left의 경우 맨 앞의 배열 값을 맨뒤로 넣어주면서 앞으로 밀어준다.
	// Right의 경우에는 맨 뒤의 배열 값을 맨 앞으로 넣어주면서 뒤로 밀어준다.

	assign out = td;

endmodule

