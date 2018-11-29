`define BOOTH_m2A 3'd1
`define BOOTH_mA 3'd2
`define BOOTH_0 3'd3
`define BOOTH_pA 3'd4
`define BOOTH_p2A 3'd5

// 16bit Partial Product Generation Mux 
module PPGen (din, sel, dout, sign);
	input[15:0]	din;
	input[2:0]	sel;
	output[16:0]	dout;
	output	sign;
	
	reg[16:0]	dout;
	reg	sign;
	always @(sel or din) begin 
		casex(sel) 
			`BOOTH_m2A: begin dout = ~{din, 1'b0}; sign = 1'b1; end
			`BOOTH_mA: begin dout = ~{din[15], din}; sign = 1'b1; end
			`BOOTH_0: begin dout = 17'b0; sign = 1'b0; end
			`BOOTH_pA: begin dout = {din[15], din}; sign = 1'b0; end
			`BOOTH_p2A: begin dout = {din, 1'b0}; sign = 1'b0; end
			default : begin dout = 17'bX; sign = 1'bX; end
		endcase
	end
endmodule