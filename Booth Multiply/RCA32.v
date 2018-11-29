module CPA32(x, y, cin, cout, sum);
   input [31:0] x, y;
   input cin;
   output [31:0] sum;
   output cout;
   
   wire [30:0] c;
   
   FA FA0(.a(x[0]), .b(y[0]), .c(cin), .sum(sum[0]), .cout(c[0]));
   FA FA1(.a(x[1]), .b(y[1]), .c(c[0]), .sum(sum[1]), .cout(c[1]));
   FA FA2(.a(x[2]), .b(y[2]), .c(c[1]), .sum(sum[2]), .cout(c[2]));
   FA FA3(.a(x[3]), .b(y[3]), .c(c[2]), .sum(sum[3]), .cout(c[3]));
   FA FA4(.a(x[4]), .b(y[4]), .c(c[3]), .sum(sum[4]), .cout(c[4]));
   FA FA5(.a(x[5]), .b(y[5]), .c(c[4]), .sum(sum[5]), .cout(c[5]));
   FA FA6(.a(x[6]), .b(y[6]), .c(c[5]), .sum(sum[6]), .cout(c[6]));
   FA FA7(.a(x[7]), .b(y[7]), .c(c[6]), .sum(sum[7]), .cout(c[7]));
   FA FA8(.a(x[8]), .b(y[8]), .c(c[7]), .sum(sum[8]), .cout(c[8]));
   FA FA9(.a(x[9]), .b(y[9]), .c(c[8]), .sum(sum[9]), .cout(c[9]));
   FA FA10(.a(x[10]), .b(y[10]), .c(c[9]), .sum(sum[10]), .cout(c[10]));
   FA FA11(.a(x[11]), .b(y[11]), .c(c[10]), .sum(sum[11]), .cout(c[11]));
   FA FA12(.a(x[12]), .b(y[12]), .c(c[11]), .sum(sum[12]), .cout(c[12]));
   FA FA13(.a(x[13]), .b(y[13]), .c(c[12]), .sum(sum[13]), .cout(c[13]));
   FA FA14(.a(x[14]), .b(y[14]), .c(c[13]), .sum(sum[14]), .cout(c[14]));
   FA FA15(.a(x[15]), .b(y[15]), .c(c[14]), .sum(sum[15]), .cout(c[15]));
	FA FA16(.a(x[16]), .b(y[16]), .c(c[15]), .sum(sum[16]), .cout(c[16]));
   FA FA17(.a(x[17]), .b(y[17]), .c(c[16]), .sum(sum[17]), .cout(c[17]));
   FA FA18(.a(x[18]), .b(y[18]), .c(c[17]), .sum(sum[18]), .cout(c[18]));
   FA FA19(.a(x[19]), .b(y[19]), .c(c[18]), .sum(sum[19]), .cout(c[19]));
   FA FA20(.a(x[20]), .b(y[20]), .c(c[19]), .sum(sum[20]), .cout(c[20]));
   FA FA21(.a(x[21]), .b(y[21]), .c(c[20]), .sum(sum[21]), .cout(c[21]));
   FA FA22(.a(x[22]), .b(y[22]), .c(c[21]), .sum(sum[22]), .cout(c[22]));
   FA FA23(.a(x[23]), .b(y[23]), .c(c[22]), .sum(sum[23]), .cout(c[23]));
	FA FA24(.a(x[24]), .b(y[24]), .c(c[23]), .sum(sum[24]), .cout(c[24]));
   FA FA25(.a(x[25]), .b(y[25]), .c(c[24]), .sum(sum[25]), .cout(c[25]));
   FA FA26(.a(x[26]), .b(y[26]), .c(c[25]), .sum(sum[26]), .cout(c[26]));
   FA FA27(.a(x[27]), .b(y[27]), .c(c[26]), .sum(sum[27]), .cout(c[27]));
   FA FA28(.a(x[28]), .b(y[28]), .c(c[27]), .sum(sum[28]), .cout(c[28]));
   FA FA29(.a(x[29]), .b(y[29]), .c(c[28]), .sum(sum[29]), .cout(c[29]));
   FA FA30(.a(x[30]), .b(y[30]), .c(c[29]), .sum(sum[30]), .cout(c[30]));
   FA FA31(.a(x[31]), .b(y[31]), .c(c[30]), .sum(sum[31]), .cout(cout));
	
endmodule
