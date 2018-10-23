module test_RCA8bit;
   reg [7:0] x; 			// 입력	
   reg [7:0] y;			// 입력
   reg cin;					// 입력

   wire [7:0] s;			// 출력
   wire cout;				// 출력
   
	RCA8bit U0(x, y, cin, cout, s);
   
   initial begin
      #100
      x = 8'b00000001; 	// 1 + 1
      y = 8'b00000001;	// 2
      cin = 0;
      
      #100
      x = 8'b01010101;	// 85 + 170
      y = 8'b10101010;	// 255
      cin = 0;
      
      
      #100
      x = 8'b00000001;	// 1 + 0 + 1
      y = 8'b00000000;	// 2
      cin = 1;
      
      #100
      x = 8'b11111111;	// 255 + 255
      y = 8'b11111111;	// 510
      cin = 0;
      
      #100
      $finish;
   end
endmodule