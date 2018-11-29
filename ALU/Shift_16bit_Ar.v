module Shift_16bit_Ar (shift, lr, in, ov, out);
	output[15:0]out;								//	 output
	output ov;
	
	input[3:0]shift;								// shift size
	input lr;										// left or right
	input[15:0]in;
	
	wire[15:0]ta;
	wire[15:0]tb;
	wire[15:0]tc;
	wire[15:0]td;
	wire ov0, ov1, ov2, ov3;
	
	assign ov0 = lr ? 1'b0 : (shift[0] ? (in[15:15] ? 1'b1 : 1'b0) :1'b0);
	assign ov1 = lr ? 1'b0 : (shift[1] ? (in[15:15] ? 1'b1 : 1'b0) :1'b0);
	assign ov2 = lr ? 1'b0 : (shift[2] ? (in[15:15] ? 1'b1 : 1'b0) :1'b0);
	assign ov3 = lr ? 1'b0 : (shift[3] ? (in[15:15] ? 1'b1 : 1'b0) :1'b0);
	
	assign ta = shift[0] ? (lr ? {in[14:0], 1'b0} : {in[15:15], in[15:1]}) : in; // shift[0] == 1일때 이동(Ir에 따라 left or Right)
	assign tb = shift[1] ? (lr ? {ta[13:0], 2'b0} : {in[15:15],in[15:15], ta[15:2]}) : ta; // shift[1] == 1일때 이동(Ir에 따라 left or Right
	assign tc = shift[2] ? (lr ? {tb[11:0], 4'b0} : {in[15:15],in[15:15],in[15:15],in[15:15], tb[15:4]}) : tb; // shift[2] == 1일때 이동(Ir에 따라 left or Right)
	assign td = shift[3] ? (lr ? {tc[7:0], 8'b0} : {in[15:15],in[15:15],in[15:15],in[15:15],in[15:15],in[15:15],in[15:15],in[15:15], tc[15:8]}) : tc; // shift[3] == 1일때 이동(Ir에 따라 left or Right)
	// Left의 경우 맨 뒤에 0을 추가해주는 형식으로 밀어준다.
	// Right의 경우 맨 앞에 0을 추가해주는 형식으로 밀어준다.
	
	assign ov = ov0 | ov1 | ov2 | ov3;
	assign out = td;

endmodule



