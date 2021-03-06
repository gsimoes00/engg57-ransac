module inlier_checker(clk, x3, y3, deltaX, deltaY, beta, threshold, inlier);
	
	input wire clk;
	input wire signed [8:0] x3;
   input wire signed [8:0] y3;
   input wire signed [8:0] deltaX;
   input wire signed [8:0] deltaY;
	input wire signed [16:0] beta;
	input wire signed [31:0] threshold;
   output reg inlier;
	
   reg signed [17:0] mul1;
	reg signed [17:0] mul2;
	reg signed [18:0] sub1;
	reg signed [19:0] sum1;
	reg signed [39:0] sqr1;

	always @(negedge clk)
		begin
		mul1 <= x3 * deltaY;
		mul2 <= y3 * deltaX;
		sub1 <= mul1 - mul2;
		sum1 <= sub1 + beta;
		sqr1 <= sum1 * sum1;
		inlier <= sqr1 <= {8'h00, threshold} ? 1'b1 : 1'b0;
		end
	  
endmodule