module counter(
	input clk, rst_n,
	output reg [3:0] c);
always @(posedge clk or negedge rst_n)
	if(!rst_n) c <=0;
	else c<= c+1;
endmodule
