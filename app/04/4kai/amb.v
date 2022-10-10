`include "def.h"
module amb(
input clk, input rst_n,
input [`OPCODE_W-1:0] opcode,
input [`ADDR_W-1:0] operand,
input [`DATA_W-1:0] ddatain,
output we,
output reg [`ADDR_W-1:0] pc,
output reg [`DATA_W-1:0] accum);

wire [`DATA_W-1:0] alu_y;
wire op_st, op_bez, op_bnz;

assign op_st = opcode == `OP_ST;
assign op_bez = opcode == `OP_BEZ;
assign op_bnz = opcode == `OP_BNZ;

assign we = op_st;
alu alu_1(.a(accum), .b(ddatain), .s(opcode[`SEL_W-1:0]), .y(alu_y));

always @(posedge clk or negedge rst_n)
begin
   if(!rst_n) pc <= 0;
   else if (op_bez & (accum == 0) | op_bnz & (accum != 0))
        pc <= operand;
   else pc <= pc + 1;
end

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n) accum <= 0;
    else if(!op_st & !op_bez & !op_bnz ) accum <= alu_y;
end

endmodule
