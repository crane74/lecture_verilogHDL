`include "def.h"
module dpath(
input clk, input rst_n, 
input [`DATA_W-1:0] datain,
input [`SEL_W-1:0] com,
output reg [`DATA_W-1:0] accum);

wire [`DATA_W-1:0] alu_y;

assign accout = accum;
alu alu_1(.a(accum), .b(datain), .s(com), .y(alu_y));

always @(posedge clk or negedge rst_n) 
begin
    if(!rst_n) accum <= `DATA_W'b0;
    else accum <= alu_y;
end
endmodule
