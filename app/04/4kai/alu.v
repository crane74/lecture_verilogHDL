`include "def.h"

module alu (
  input [`DATA_W-1:0] a, b,
  input [`SEL_W-1:0] s,
  output [`DATA_W-1:0] y );
  assign y = s==`ALU_THA ? a:
             s==`ALU_THB ? b:
             s==`ALU_AND ? a & b:
             s==`ALU_OR ? a | b:
             s==`ALU_SL ? a<<1:
             s==`ALU_SR ? a>>1:
             s==`ALU_ADD ? a + b: a - b ;
endmodule
