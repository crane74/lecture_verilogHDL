/* test bench */
`timescale 1ns/1ps
`include "def.h"
module test;
parameter STEP = 10;
   reg clk, rst_n;
   wire [`DATA_W-1:0] ddataout ;
   wire [`ADDR_W-1:0] pcout;
   wire [`OPCODE_W-1:0] opcode;
   wire [`ADDR_W-1:0] operand;
   wire we;

   reg [`DATA_W-1:0] dmem [`DEPTH-1:0];
   reg [`INST_W-1:0] imem [`DEPTH-1:0];

   assign opcode = imem[pcout][11:8];
   assign operand = imem[pcout][7:0];

   always #(STEP/2) begin
            clk <= ~clk;
   end
   always @(posedge clk)
        if (we) dmem[operand] = ddataout;

   am am0(.clk(clk), .rst_n(rst_n), .pcout(pcout), .accum(ddataout),
        .opcode(opcode), .operand(operand), .we(we), .ddatain(dmem[operand]) );

   initial begin
      $dumpfile("am.vcd");
      $dumpvars(0,test);
      $readmemh("dmem.dat", dmem);
      $readmemb("imem.dat", imem);
      clk <= `DISABLE;
      rst_n <= `ENABLE_N;
   #(STEP*1/4)
   #STEP
      rst_n <= `DISABLE_N;
   #(STEP*24)
   $finish;
   end

   always @(negedge clk) begin
      $display("pc:%h opcode:%b operand:%b acc:%h", pcout, opcode,operand, am0.accum);
      $display("dmem:%h %h %h %h", dmem[0], dmem[1], dmem[2], dmem[3]);
   end
endmodule

