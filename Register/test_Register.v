module test_Register;
   reg clk;
   reg nRESET;
   reg write_enable; 		// write에 대한 enable
   reg [2:0] write_addr; // Write할 주소
   reg [15:0] write_data;// Write할 데이터
   reg [2:0] read_addr_A;
   reg [2:0] read_addr_B;  
   reg [2:0] read_addr_C;// Read 할 주소
	
	wire [15:0] read_data_A;
	wire [15:0] read_data_B;
	wire [15:0] read_data_C; // Read 후 저장된 데이터
	
	Register register(clk,nRESET,write_enable,write_addr,write_data,read_addr_A,read_addr_B,read_addr_C,read_data_A,read_data_B,read_data_C);

	always #100 clk = ~clk; // Clock 설정
	
	initial begin
		clk = 1'b1; 
		nRESET = 1'b1; 		// 초기 Reset
		write_enable = 1'b1;	// Write에 대한 enable
		
		#200
		write_addr = 3'd0;
		write_data = 1;
		
		#200
		write_addr = 3'd1;
		write_data = 2;
		
		#200
		write_addr = 3'd2;
		write_data = 3;

		#200
		read_addr_A = 3'd0;
		read_addr_B = 3'd1;
		read_addr_C = 3'd2;
		#200
		
		#200
		write_addr = 3'd3;
		write_data = 4;
		
		#200
		write_addr = 3'd4;
		write_data = 5;
		
		#200
		write_addr = 3'd5;
		write_data = 6;

		#200
		read_addr_A = 3'd3;
		read_addr_B = 3'd4;
		read_addr_C = 3'd5;
		#200
		
		$finish;
	end
endmodule 