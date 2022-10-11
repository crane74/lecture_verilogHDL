`include "def.h"
module am(
input clk, input rst_n,
input [`OPCODE_W-1:0] opcode,
input [`ADDR_W-1:0] operand,
input [`DATA_W-1:0] ddatain,
output we,
output [`ADDR_W-1:0] pcout,
output reg [`DATA_W-1:0] accum);

reg [`ADDR_W-1:0] pc;
wire [`DATA_W-1:0] alu_y;
wire op_st;

assign op_st = opcode == `OP_ST;

assign we = op_st;
assign pcout = pc;
alu alu_1(.a(accum), .b(ddatain), .s(opcode[`SEL_W-1:0]), .y(alu_y));

always @(posedge clk or negedge rst_n)
begin
   if(!rst_n) pc <= 0;
   else pc <= pc + 1;
end

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n) accum <= 0;
    else if(!op_st ) accum <= alu_y;
end

endmodule
