/* test bench */
`timescale 1ns/1ps

module test_an;
   parameter STEP = 10;
   reg ina, inb;
   wire outs;
   an an_1(.a(ina), .b(inb), .s(outs));
   initial begin
      $dumpfile("an.vcd");
      $dumpvars(0,an_1);
      ina <= 1'b0;
      inb <= 1'b0;
      #STEP
      $display("a:%b b:%b s:%b", ina, inb, outs);
      ina <= 1'b0;
      inb <= 1'b1;
      #STEP
      $display("a:%b b:%b s:%b", ina, inb, outs);
      ina <= 1'b1;
      inb <= 1'b0;
      #STEP
      $display("a:%b b:%b s:%b", ina, inb, outs);
      ina <= 1'b1;
      inb <= 1'b1;
      #STEP
      $display("a:%b b:%b s:%b", ina, inb, outs);
      ina <= 1'b0;
      inb <= 1'b0;
     $finish;
   end
endmodule
