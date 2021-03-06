`define BOOTH_m2A	3'd1
`define BOOTH_mA	3'd2
`define BOOTH_0	3'd3
`define BOOTH_pA	3'd4
`define BOOTH_p2A	3'd5

// Booth Encoder
module BOOTH(data, sel);
	input[2:0]data;
	output[2:0]sel;
	reg[2:0]sel;
	
	always @(data) begin
		case(data)
			3'b000 : begin sel = `BOOTH_0; end
			3'b010 : begin sel = `BOOTH_pA; end
			3'b100 : begin sel = `BOOTH_m2A; end 
			3'b110 : begin sel = `BOOTH_mA; end 
			3'b001 : begin sel = `BOOTH_pA; end 
			3'b011 : begin sel = `BOOTH_p2A; end 
			3'b101 : begin sel = `BOOTH_mA; end 
			3'b111 : begin sel = `BOOTH_0; end 
		endcase
	end
endmodule
