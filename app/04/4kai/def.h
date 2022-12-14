`define STAT_W 16 
`define DATA_W 16 
`define SEL_W 3
`define ADDR_W 8
`define OPCODE_W 4
`define INST_W `OPCODE_W+`ADDR_W
`define DEPTH 256
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
`define OP_ST `OPCODE_W'b1000
`define OP_BEZ `OPCODE_W'b1001
`define OP_BNZ `OPCODE_W'b1010
`define OP_LDI `OPCODE_W'b1011
`define OP_ADDI `OPCODE_W'b1110
