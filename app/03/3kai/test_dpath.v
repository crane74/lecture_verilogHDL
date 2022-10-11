/* test bench */
`timescale 1ns/1ps
`include "def.h"
module test;
parameter STEP = 10;
   reg clk, rst_n;
   reg [`SEL_W-1:0] s;
   reg [`DATA_W-1:0] b ;
   wire [`DATA_W-1:0] accum;
   dpath dpath0(.clk(clk), .rst_n(rst_n), .com(s),
               .datain(b), .accum(accum));
   initial begin
      $dumpfile("dpath.vcd");
      $dumpvars(0,test);
      clk <= 0;
      rst_n <= 0;
  #STEP rst_n <= 1;
	s<= 3'b001; b<=16'h2222;
  #STEP clk <=1; #STEP clk <=0;
     $display("s:%b b:%h accum:%h", s, b, accum);
	s<= 3'b110; b<=16'h3333;
  #STEP clk <=1; #STEP clk <=0;
     $display("s:%b b:%h accum:%h", s, b, accum);
	s<= 3'b111; b<=16'h1111;
  #STEP clk <=1; #STEP clk <=0;
     $display("s:%b b:%h accum:%h", s, b, accum);
	s<= 3'b110; b<=16'h4444;
  #STEP clk <=1; #STEP clk <=0;
     $display("s:%b b:%h accum:%h", s, b, accum);
	 $finish;
  end
endmodule
