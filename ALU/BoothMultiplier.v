module BoothMultiplier(x, y, result, ov);
	input[15:0]x;		// input
	input[15:0]y;		// input
	output[15:0]result;		// output
	output ov;
	
	wire [31:0] z;
	
	wire [2:0] sel0;	// booth encoding 결과 저장
	wire [2:0] sel1;
	wire [2:0] sel2;
	wire [2:0] sel3;
	wire [2:0] sel4;
	wire [2:0] sel5;
	wire [2:0] sel6;
	wire [2:0] sel7;
	
	wire [16:0] psum0; // partial product
	wire [16:0] psum1;
	wire [16:0] psum2;
	wire [16:0] psum3;
	wire [16:0] psum4;
	wire [16:0] psum5;
	wire [16:0] psum6;
	wire [16:0] psum7;
	
	wire [19:0] sum0;	 // partial product 후 CSA의 합
	wire [19:0] sum1;
	wire [19:0] sum2;
	wire [19:0] sum3;
	wire [19:0] sum4;
	wire [19:0] sum5;
	wire [18:0] sum6;
	
	wire [19:0]carry0;	// partial product 후 생기는 CSA의 Carry
	wire [19:0]carry1;
	wire [19:0]carry2;
	wire [19:0]carry3;
	wire [19:0]carry4;
	wire [19:0]carry5;
	wire [18:0]carry6;
	wire cout; 			// 오버플로우
	
	wire sign0;	// partial product의 부호 저장
	wire sign1;
	wire sign2;
	wire sign3;
	wire sign4;
	wire sign5;
	wire sign6;
	wire sign7;
	
	// 첫번째만 0을 넣어주고 이후 y값을 3bit씩 가져와서 encoding 후 sel에 저장한다.
	// Booth Encoding
	BOOTH booth0(.data({y[1:0],1'b0}), .sel(sel0));
	BOOTH booth1(.data(y[3:1]), .sel(sel1));
	BOOTH booth2(.data(y[5:3]), .sel(sel2));
	BOOTH booth3(.data(y[7:5]), .sel(sel3));
	BOOTH booth4(.data(y[9:7]), .sel(sel4));
	BOOTH booth5(.data(y[11:9]), .sel(sel5));
	BOOTH booth6(.data(y[13:11]), .sel(sel6));
	BOOTH booth7(.data(y[15:13]), .sel(sel7));
	
	// Partial Product를 통해 나온 sel값과 x와 곱해 partial product의 부호를 저장한다.
	// Partial Product Generation
	PPGen ppgen0(.din(x),.sel(sel0),.dout(psum0),.sign(sign0));
	PPGen ppgen1(.din(x),.sel(sel1),.dout(psum1),.sign(sign1));
	PPGen ppgen2(.din(x),.sel(sel2),.dout(psum2),.sign(sign2));
	PPGen ppgen3(.din(x),.sel(sel3),.dout(psum3),.sign(sign3));
	PPGen ppgen4(.din(x),.sel(sel4),.dout(psum4),.sign(sign4));
	PPGen ppgen5(.din(x),.sel(sel5),.dout(psum5),.sign(sign5));
	PPGen ppgen6(.din(x),.sel(sel6),.dout(psum6),.sign(sign6));
	PPGen ppgen7(.din(x),.sel(sel7),.dout(psum7),.sign(sign7));

	// Level 1, 2, 3의 Partial Product를 20bit 씩 더한다.
	// Carry Save Adders
	CSA20  csa0(
		.a ({3'b0,~psum0[16],psum0[16],psum0[16:2]}),
		.b ({2'b0,1'b1,~psum1[16],psum1[15:0]}),
		.c ({1'b1,~psum2[16],psum2[15:0],2'b0}),

		.cout (carry0),
		.sum (sum0));

	// Level 4
	CSA20  csa1(
		.a ({2'b0, sum0[19:2]}),                    
		.b ({1'b0, carry0[19:2],sign2}),          
		.c ({1'b1, ~psum3[16],psum3[15:0],2'b0}), 

		.cout (carry1),
		.sum (sum1));
		
	// Level 5
	CSA20  csa2(
		.a ({2'b0, sum1[19:2]}),                  
		.b ({1'b0, carry1[19:2],sign3}),          
		.c ({1'b1, ~psum4[16],psum4[15:0],2'b0}), 

		.cout (carry2),
		.sum (sum2));
	
	// Level 6
	CSA20  csa3(
		.a ({2'b0, sum2[19:2]}),                  
		.b ({1'b0, carry2[19:2],sign4}),         
		.c ({1'b1, ~psum5[16],psum5[15:0],2'b0}), 

		.cout (carry3),
		.sum (sum3));
	
	// Level 7
	CSA20  csa4(
		.a ({2'b0, sum3[19:2]}),                    
		.b ({1'b0, carry3[19:2],sign5}),          
		.c ({1'b1, ~psum6[16],psum6[15:0],2'b0}), 

		.cout (carry4),
		.sum (sum4));

	// Level 8
	CSA20  csa5(
		.a ({2'b0, sum4[19:2]}),                  
		.b ({1'b0, carry4[19:2],sign6}),          
		.c ({1'b1, ~psum7[16],psum7[15:0],2'b0}), 

		.cout (carry5),
		.sum (sum5));

	// Level 9 sign과 Carry의 총합을 반가산기를 통해 CSA에 저장한다.
	CSA19_HA  csa6(
		.a ({1'b0,sum5[19:2]}),                
		.b ({carry5[19:2],sign7}),                  

		.cout (carry6),
		.sum (sum6));
	
	// Carry Propagation Adder
	CPA32 cpa0(
		.x ({sum6[17:0],sum5[1:0],sum4[1:0],sum3[1:0],sum2[1:0],sum1[1:0],sum0[1:0],psum0[1:0]}),
		.y ({carry6[16:0],carry5[1:0],carry4[1:0],carry3[1:0],carry2[1:0],carry1[1:0],carry0[1:0],sign1,1'b0,sign0}),
		.cin (1'b0),
		.sum (z),
		.cout (cout));
	
	assign ov = z[16];
	assign result = z[15:0];
	
endmodule