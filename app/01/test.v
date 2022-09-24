/* test bench */
`timescale 1ns/1ps

module test;
   parameter STEP = 10;
   reg ina, inb;
   wire outs;
   adder adder_1(.a(ina), .b(inb), .s(outs));
   initial begin
      $dumpfile("adder.vcd");
      $dumpvars(0,adder_1);
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
