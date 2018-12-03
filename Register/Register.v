module Register(clk, nRESET, write_enable, write_addr, write_data, read_addr_A, read_addr_B, read_addr_C, read_data_A, read_data_B, read_data_C);

   input clk;
   input nRESET;
   input write_enable; 		// write에 대한 enable
   input [2:0] write_addr; // Write할 주소
   input [15:0] write_data;// Write할 데이터
   input [2:0] read_addr_A;
   input [2:0] read_addr_B;  
   input [2:0] read_addr_C;// Read 할 주소
	
   output [15:0] read_data_A;
   output [15:0] read_data_B;
   output [15:0] read_data_C;// Read 후 저장된 데이터
	
   reg [15:0] reg_0;
   reg [15:0] reg_1;
   reg [15:0] reg_2;
   reg [15:0] reg_3;
   reg [15:0] reg_4;
   reg [15:0] reg_5;
   reg [15:0] reg_6;
   reg [15:0] reg_7;				// Read할 데이터가 저장된 곳

   wire [7:0] decoder_out; 	// Write 시 사용할 Reg 결정
   wire [7:0] reg_enable; 		// Register Select 

	assign decoder_out =			// Write할 Reg 결정
      (write_addr == 3'b000) ? 8'b00000001 :
      (write_addr == 3'b001) ? 8'b00000010 :
      (write_addr == 3'b010) ? 8'b00000100 :
      (write_addr == 3'b011) ? 8'b00001000 :
      (write_addr == 3'b100) ? 8'b00010000 :
      (write_addr == 3'b101) ? 8'b00100000 :
      (write_addr == 3'b110) ? 8'b01000000 :
      (write_addr == 3'b111) ? 8'b10000000 : 8'bx;

   assign reg_enable[0] = write_enable & decoder_out[0];
   assign reg_enable[1] = write_enable & decoder_out[1];
   assign reg_enable[2] = write_enable & decoder_out[2];
   assign reg_enable[3] = write_enable & decoder_out[3];
   assign reg_enable[4] = write_enable & decoder_out[4];
   assign reg_enable[5] = write_enable & decoder_out[5];
   assign reg_enable[6] = write_enable & decoder_out[6];
   assign reg_enable[7] = write_enable & decoder_out[7];
	// Register의 Write에 대한 enable
	
	always @ (posedge clk or negedge nRESET)
		if (!nRESET)
			reg_0 <= 16'b0;
		else if(reg_enable[0])
			reg_0 <= write_data;
			
	always @ (posedge clk or negedge nRESET)
		if (!nRESET)
			reg_1 <= 16'b0;
		else if(reg_enable[1])
			reg_1 <= write_data;

	always @ (posedge clk or negedge nRESET)
		if (!nRESET)
			reg_2 <= 16'b0;
		else if(reg_enable[2])
			reg_2 <= write_data;

	always @ (posedge clk or negedge nRESET)
		if (!nRESET)
			reg_3 <= 16'b0;
		else if(reg_enable[3])
			reg_3 <= write_data;
			
	always @ (posedge clk or negedge nRESET)
		if (!nRESET)
			reg_4 <= 16'b0;
		else if(reg_enable[4])
			reg_4 <= write_data;
			
	always @ (posedge clk or negedge nRESET)
		if (!nRESET)
			reg_5 <= 16'b0;
		else if(reg_enable[5])
			reg_5 <= write_data;
			
	always @ (posedge clk or negedge nRESET)
		if (!nRESET)
			reg_6 <= 16'b0;
		else if(reg_enable[6])
			reg_6 <= write_data;
			
	always @ (posedge clk or negedge nRESET)
		if (!nRESET)
			reg_7 <= 16'b0;
		else if(reg_enable[7])
			reg_7 <= write_data;
	// 매 Clock에 따라 Register에 값 저장
			
	assign read_data_A =
		(read_addr_A == 3'd0) ? reg_0 :
		(read_addr_A == 3'd1) ? reg_1 :
		(read_addr_A == 3'd2) ? reg_2 :
		(read_addr_A == 3'd3) ? reg_3 :
		(read_addr_A == 3'd4) ? reg_4 :
		(read_addr_A == 3'd5) ? reg_5 :
		(read_addr_A == 3'd6) ? reg_6 :
		(read_addr_A == 3'd7) ? reg_7 : 16'bx;
		
	assign read_data_B =
		(read_addr_B == 3'd0) ? reg_0 :
		(read_addr_B == 3'd1) ? reg_1 :
		(read_addr_B == 3'd2) ? reg_2 :
		(read_addr_B == 3'd3) ? reg_3 :
		(read_addr_B == 3'd4) ? reg_4 :
		(read_addr_B == 3'd5) ? reg_5 :
		(read_addr_B == 3'd6) ? reg_6 :
		(read_addr_B == 3'd7) ? reg_7 : 16'bx;
		
	assign read_data_C =
		(read_addr_C == 3'd0) ? reg_0 :
		(read_addr_C == 3'd1) ? reg_1 :
		(read_addr_C == 3'd2) ? reg_2 :
		(read_addr_C == 3'd3) ? reg_3 :
		(read_addr_C == 3'd4) ? reg_4 :
		(read_addr_C == 3'd5) ? reg_5 :
		(read_addr_C == 3'd6) ? reg_6 :
		(read_addr_C == 3'd7) ? reg_7 : 16'bx;
		
	// Register에서 Data를 Read
	
endmodule
