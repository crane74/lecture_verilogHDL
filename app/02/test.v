`include "def.h"

module test;
parameter STEP = 10;
   reg [`DATA_W-1:0] ina, inb;
   reg [`SEL_W-1:0] sel;
   wire [`DATA_W-1:0] outs;

   alu alu_1(.a(ina), .b(inb), .s(sel), .y(outs));
   initial begin
      $dumpfile("alu.vcd");
      $dumpvars(0,alu_1);
      ina <= `DATA_W'haaaa;
      inb <= `DATA_W'h2222;
      sel <= `ALU_THA;
     #STEP
      $display("a:%h b:%h s:%h y:%h", ina, inb, sel, outs);
      sel <= `ALU_THB;
     #STEP
      $display("a:%h b:%h s:%h y:%h", ina, inb, sel, outs);
      sel <= `ALU_AND;
     #STEP
      $display("a:%h b:%h s:%h y:%h", ina, inb, sel, outs);
      sel <= `ALU_ADD;
     #STEP
      $display("a:%h b:%h s:%h y:%h", ina, inb, sel, outs);
      sel <= `ALU_SL;
     #STEP
      $display("a:%h b:%h s:%h y:%h", ina, inb, sel, outs);
      sel <= `ALU_SR;
     #STEP
      $display("a:%h b:%h s:%h y:%h", ina, inb, sel, outs);
     $finish;
   end
endmodule
