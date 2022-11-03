`include "def.h"
module poco(
input clk, rst_n,
input [`DATA_W-1:0] idatain,
input [`DATA_W-1:0] ddatain,
output [`DATA_W-1:0] iaddr, daddr,
output [`DATA_W-1:0] ddataout,
output we);

reg [`DATA_W-1:0] pc;
wire [`DATA_W-1:0] rf_a, rf_b, rf_c;
wire [`DATA_W-1:0] alu_b, alu_y;
wire [`OPCODE_W-1:0] opcode;
wire [`OPCODE_W-1:0] func;
wire [`REG_W-1:0] rs, rd;
wire [`SEL_W-1:0] com;
wire [`IMM_W-1:0] imm;
wire rwe;
wire st_op, bez_op, bnz_op, addi_op, ld_op, alu_op;
wire ldi_op, ldiu_op, addiu_op;
wire bmi_op, bpl_op, jmp_op, jr_op;

assign ddataout = rf_a;
assign iaddr = pc;
assign daddr = rf_b;

assign {opcode, rd, rs, func} = idatain;
assign imm = idatain[`IMM_W-1:0];

// Decorder
assign st_op = (opcode == `OP_REG) & (func == `F_ST);
assign ld_op = (opcode == `OP_REG) & (func == `F_LD);
assign jr_op = (opcode == `OP_REG) & (func == `F_JR);
assign alu_op = (opcode == `OP_REG) & (func[4:3] == 2'b00); assign ldi_op = (opcode == `OP_LDI);
assign ldiu_op = (opcode == `OP_LDIU);
assign addi_op = (opcode == `OP_ADDI);
assign addiu_op = (opcode == `OP_ADDIU);
assign bez_op = (opcode == `OP_BEZ);
assign bnz_op = (opcode == `OP_BNZ);
assign bmi_op = (opcode == `OP_BMI);
assign bpl_op = (opcode == `OP_BPL);
assign jmp_op = (opcode == `OP_JMP);

assign we = st_op;

assign alu_b = (addi_op | ldi_op) ? {{8{imm[7]}},imm} :
		(addiu_op | ldiu_op) ? {8'b0,imm} : rf_b;

assign com = (addi_op | addiu_op ) ? `ALU_ADD: 
		(ldi_op | ldiu_op ) ? `ALU_THB: func[`SEL_W-1:0];

assign rf_c = ld_op  ? ddatain : alu_y;
assign rwe = ld_op  | alu_op | ldi_op | ldiu_op | addi_op | addiu_op  ;

alu alu_1(.a(rf_a), .b(alu_b), .s(com), .y(alu_y));

rfile rfile_1(.clk(clk), .a(rf_a), .aadr(rd), .b(rf_b), .badr(rs), 
	.c(rf_c), .cadr(rd), .we(rwe));

always @(posedge clk or negedge rst_n) 
begin 
   if(!rst_n) pc <= 0;
   else if ((bez_op & rf_a == 16'b0 ) | (bnz_op & rf_a != 16'b0) |
   			(bpl_op & ~rf_a[15]) | (bmi_op & rf_a[15]) )
     pc <= pc +{{8{imm[7]}},imm}+1 ;
   else if(jmp_op)
     pc <= pc +{{5{idatain[10]}},idatain[10:0]}+1 ;
   else if(jr_op)
   	 pc <= rf_a;
   else 
     pc <= pc+1;
end

endmodule
