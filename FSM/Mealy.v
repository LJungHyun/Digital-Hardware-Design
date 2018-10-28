`define INIT 1'b0
`define ONE 2'b01
`define TWO 2'b10
`define THREE 2'b11
`define FOUR 3'b100
`define FIVE 3'b101
`define SIX 3'b110

module Mealy (nRESET, clk, in, out);
	input nRESET, clk, in;
	output out;
	reg [2:0] curState, nextState;
	reg out;
	
	always @(posedge clk or negedge nRESET)		// 플립플롭 Reset
		if (!nRESET) curState <=`INIT;				// Reset curState를 INIT으로 초기화
		else curState <= nextState;					// nextState를 curState를 대입
		
	always @(curState or in)
		casex (curState)
			`INIT:							// init
				if(in == 0) begin			// 0
					nextState = `ONE;
					out = 1'b0;
				end
				else begin					// 1
					nextState = `FOUR;
					out = 1'b0;
				end
				
			`ONE:								// 0
				if(in == 0) begin			// 00
					nextState = `TWO;
					out =1'b0;
				end
				else begin
					nextState = `FOUR;	// 1
					out = 1'b0;
				end
			`TWO:								// 00
				if(in == 0) begin			// 000
					nextState = `THREE;
					out =1'b0;
				end
				else begin
					nextState = `FOUR;	// 1
					out = 1'b0;
				end
			`THREE:							// 000
				if(in == 0) begin			// 0000
					nextState = `THREE;
					out =1'b1;
				end
				else begin
					nextState = `FOUR;	// 1
					out = 1'b0;
				end
				
				
			`FOUR:							// 1
				if(in == 1) begin			// 11
					nextState = `FIVE;
					out =1'b0;
				end
				else begin
					nextState = `ONE;		// 0
					out = 1'b0;
				end
			`FIVE:							// 11
				if(in == 1) begin			// 111
					nextState = `SIX;
					out =1'b0;
				end
				else begin
					nextState = `ONE;		// 0
					out = 1'b0;
				end
			`SIX:								// 111
				if(in == 1) begin			// 1111
					nextState = `SIX;
					out =1'b1;
				end
				else begin
					nextState = `ONE;		// 0
					out = 1'b0;
				end
				
			default:begin
				nextState =`INIT;
				out = 1'b0;
			end
		endcase
endmodule