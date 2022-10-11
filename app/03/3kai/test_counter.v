/* test bench */
`timescale 1ns/1ps
module test;
parameter STEP = 10;
   reg clk, rst_n;
   wire [3:0] c;
   always #(STEP/2) begin
   	clk <= ~clk;
   end
   counter counter0(.clk(clk), .rst_n(rst_n), .c(c));
   initial begin
      $dumpfile("counter.vcd");
      $dumpvars(0,test);
      clk <= 0;
      rst_n <= 0;
  #(STEP*1/4) rst_n <= 1;
  #(STEP*20) $finish;
  end

   always @(posedge clk)
     $display("counter:%h ", c);

endmodule
