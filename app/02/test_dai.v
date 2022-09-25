module test; 
parameter STEP = 10;
   reg [3:0] ina;
   wire  outs;
   
   dai dai_1(.month(ina), .d(outs));

   initial begin
      $dumpfile("dai.vcd");
      $dumpvars(0,dai_1);
      ina <= 1;
     #STEP
      $display("a:%d y:%b", ina, outs);
      ina <= 2;
     #STEP
      $display("a:%d y:%b", ina, outs);
      ina <= 3;
     #STEP
      $display("a:%d y:%b", ina, outs);
      ina <= 4;
     #STEP
      $display("a:%d y:%b", ina, outs);
      ina <= 5;
     #STEP
      $display("a:%d y:%b", ina, outs);
      ina <= 6;
     #STEP
      $display("a:%d y:%b", ina, outs);
      ina <= 7;
     #STEP
      $display("a:%d y:%b", ina, outs);
      ina <= 8;
     #STEP
      $display("a:%d y:%b", ina, outs);
      ina <= 9;
     #STEP
      $display("a:%d y:%b", ina, outs);
      ina <= 10;
     #STEP
      $display("a:%d y:%b", ina, outs);
      ina <= 11;
     #STEP
      $display("a:%d y:%b", ina, outs);
      ina <= 12;
     #STEP
      $display("a:%d y:%b", ina, outs);
     #STEP
     $finish;
   end 
endmodule
