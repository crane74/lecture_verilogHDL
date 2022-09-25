module alu (
    input  [15:0] a,
    b,
    input  [ 2:0] s,
    output [15:0] y
);

  assign y = s==3'b000 ? a:
             s==3'b001 ? b:
             s==3'b010 ? a & b:
             s==3'b011 ? a | b:
             s==3'b100 ? a << 1:
             s==3'b101 ? a >> 1:
             s==3'b110 ? a + b : a - b ;
endmodule