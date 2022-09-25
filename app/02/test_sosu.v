module test; 
parameter STEP = 10;
   reg [3:0] ina;
   wire  outs;
   
   sosu sosu_1(.a(ina), .y(outs));

   initial begin
      $dumpfile("sosu.vcd");
      $dumpvars(0,sosu_1);
      ina <= 1;
     #STEP
      $display("a:%h y:%h", ina, outs);
      ina <= 2;
     #STEP
      $display("a:%h y:%h", ina, outs);
      ina <= 3;
     #STEP
      $display("a:%h y:%h", ina, outs);
      ina <= 4;
     #STEP
      $display("a:%h y:%h", ina, outs);
      ina <= 5;
     #STEP
      $display("a:%h y:%h", ina, outs);
      ina <= 6;
     #STEP
      $display("a:%h y:%h", ina, outs);
      ina <= 7;
     #STEP
      $display("a:%h y:%h", ina, outs);
      ina <= 8;
     #STEP
      $display("a:%h y:%h", ina, outs);
      ina <= 9;
     #STEP
      $display("a:%h y:%h", ina, outs);
      ina <= 10;
     #STEP
      $display("a:%h y:%h", ina, outs);
      ina <= 11;
     #STEP
      $display("a:%h y:%h", ina, outs);
      ina <= 12;
     #STEP
      $display("a:%h y:%h", ina, outs);
      ina <= 13;
     #STEP
      $display("a:%h y:%h", ina, outs);
      ina <= 14;
     #STEP
      $display("a:%h y:%h", ina, outs);
      ina <= 15;
     #STEP
      $display("a:%h y:%h", ina, outs);
     $finish;
   end 
endmodule
