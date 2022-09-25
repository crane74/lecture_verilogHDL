module dai( input [3:0] month,output d);

   assign d= month < 8 (? month[0] : (month < 13 ?  ~month[0] : 1'b0));

endmodule



