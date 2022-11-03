/* test bench */
`timescale 1ns/1ps
`include "def.h"
module test;
parameter STEP = 10;
   reg clk, rst_n;
   wire [`DATA_W-1:0] ddataout ;
   wire [`DATA_W-1:0] daddr, iaddr;
   wire we;
   reg [`DATA_W-1:0] dmem [0:`DEPTH-1];
   reg [`DATA_W-1:0] imem [0:`DEPTH-1];

   always #(STEP/2) begin
            clk <= ~clk;
   end

   poco poco_1(.clk(clk), .rst_n(rst_n), .idatain(imem[iaddr]),
               .ddatain(dmem[daddr]), .iaddr(iaddr), .daddr(daddr),
               .ddataout(ddataout), .we(we));

   always @(posedge clk) 
   begin 
      if(we) dmem[daddr] <= ddataout;
   end

   initial begin
      $dumpfile("poco.vcd");
      $dumpvars(0,test);
      $readmemh("dmem.dat", dmem);
      $readmemb("imem.dat", imem);
      clk <= `DISABLE;
      rst_n <= `ENABLE_N;
   #(STEP*1/4)
   #STEP
      rst_n <= `DISABLE_N;
   #(STEP*100)            
   $finish;
   end

   always @(negedge clk) begin
      $display("pc:%h idatain:%b ", poco_1.pc, poco_1.idatain);
      $display("reg:%h %h %h %h %h %h %h %h", 
	poco_1.rfile_1.r0, poco_1.rfile_1.r1, poco_1.rfile_1.r2,
	poco_1.rfile_1.r3, poco_1.rfile_1.r4, poco_1.rfile_1.r5,
	poco_1.rfile_1.r6, poco_1.rfile_1.r7);
      $display("dmem:%h %h %h %h dmem[8]%h", dmem[0], dmem[1], dmem[2], dmem[3], dmem[8]);
   end
endmodule
