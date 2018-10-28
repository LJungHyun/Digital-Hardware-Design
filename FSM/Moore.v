`define INIT 1'b0
`define ONE 2'b01
`define TWO 2'b10
`define THREE 2'b11
`define FOUR 3'b100
`define FIVE 3'b101
`define SIX 3'b110

module Moore (nRESET, clk, in, out);
	input nRESET, clk, in;
	output out;
	reg [2:0] curState, nextState;
	reg out;
	
	always @(posedge clk or negedge nRESET)		// 플립플롭 Reset
		if (!nRESET) curState <=`INIT;				// Reset curState를 INIT으로 초기화	
		else curState <= nextState;					// nextState를 curState를 대입
		
	always @(curState or in)
		casex (curState)
			`INIT: begin									// init
				if(in == 0) nextState = `ONE;			// 0
				else nextState = `FOUR;					// 1
				out = 1'b0;
			end
			
			`ONE: begin										// 0
				if(in == 0) nextState = `TWO;			// 00
				else nextState = `FOUR;					// 1
				out = 1'b0;
			end
			`TWO: begin										// 00
				if(in == 0) nextState = `THREE;		// 000
				else nextState = `FOUR;					// 1
				out = 1'b0;
			end
			`THREE: begin									// 000
				if(in == 0) nextState = `THREE;		// 0000
				else nextState = `FOUR;					// 1
				out = 1'b1;
			end
		
			`FOUR: begin									// 1
				if(in == 1) nextState = `FIVE;		// 11
				else nextState = `ONE;					// 0
				out = 1'b0;
			end
			`FIVE: begin									// 11
				if(in == 1) nextState = `SIX;			// 111
				else nextState = `ONE;					// 0
				out = 1'b0;
			end
			`SIX: begin										// 111
				if(in == 1) nextState = `SIX;			// 1111
				else nextState = `ONE;					// 0
				out = 1'b1;
			end
	
			default:begin
				nextState =`INIT;
				out = 1'b0;
			end
		endcase
endmodule