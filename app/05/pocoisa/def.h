`define DATA_W 16 
`define SEL_W 3
`define REG 8
`define REG_W 3
`define OPCODE_W 5
`define IMM_W 8
`define DEPTH 65536

`define ALU_THA `SEL_W'b000
`define ALU_THB `SEL_W'b001
`define ALU_AND `SEL_W'b010
`define ALU_OR `SEL_W'b011
`define ALU_SL `SEL_W'b100
`define ALU_SR `SEL_W'b101
`define ALU_ADD `SEL_W'b110
`define ALU_SUB `SEL_W'b111

`define ENABLE 1'b1
`define DISABLE 1'b0
`define ENABLE_N 1'b0
`define DISABLE_N 1'b1

`define OP_REG `OPCODE_W'b00000
`define OP_LDI `OPCODE_W'b01000
`define OP_LDIU `OPCODE_W'b01001
`define OP_ADDI `OPCODE_W'b01100
`define OP_ADDIU `OPCODE_W'b01101
`define OP_LDHI `OPCODE_W'b01010   // Temporaly
`define F_ST `OPCODE_W'b01000
`define F_LD `OPCODE_W'b01001

`define STAT_W 2
`define STAT_IF `STAT_W'b01
`define IF 1'b0
`define STAT_EX `STAT_W'b10
`define EX 1'b1
