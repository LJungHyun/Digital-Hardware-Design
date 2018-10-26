`define INIT 1'b0
`define ONE 2'b01
`define TWO 2'b10
`define THREE 2'b11
`define FOUR 3'b100
`define FIVE 3'b101
`define SIX 3'b110
`define SEVEN 3'b111
`define EIGHT 4'b1000


module Moore (nRESET, clk, in, out);
	input nRESET, clk, in;
	output out;
	reg [3:0] curState, nextState;
	reg out;
	
	always @(posedge clk or negedge nRESET)		// 플립플롭 Reset
		if (!nRESET) curState <=`INIT;				// Reset curState를 INIT으로 초기화
		else curState <= nextState;					// nextState를 curState를 대입
		
	always @(curState or in)
		casex (curState)
			`INIT: begin							// init
				if(in == 0) nextState = `ONE;
				else nextState = `FIVE;
				out = 1'b0;
			end
			
			`ONE: begin							// init
				if(in == 0) nextState = `TWO;
				else nextState = `FIVE;
				out = 1'b0;
			end
			`TWO: begin							// init
				if(in == 0) nextState = `THREE;
				else nextState = `FIVE;
				out = 1'b0;
			end
			`THREE: begin							// init
				if(in == 0) nextState = `THREE;
				else nextState = `FIVE;
				out = 1'b1;
			end
/*			`FOUR: begin							// init
				if(in == 0) nextState = `FOUR;
				else nextState = `FIVE;
				out = 1'b0;
			end
*/			
			`FIVE: begin							// init
				if(in == 1) nextState = `SIX;
				else nextState = `ONE;
				out = 1'b0;
			end
			`SIX: begin							// init
				if(in == 1) nextState = `SEVEN;
				else nextState = `ONE;
				out = 1'b0;
			end
			`SEVEN: begin							// init
				if(in == 1) nextState = `SEVEN;
				else nextState = `ONE;
				out = 1'b1;
			end
/*			
			`EIGHT: begin							// init
				if(in == 1) nextState = `EIGHT;
				else nextState = `ONE;
				out = 1'b1;
			end
*/			
			default:begin
				nextState =`INIT;
				out = 1'b0;
			end
		endcase
endmodule