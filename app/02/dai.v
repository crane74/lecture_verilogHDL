module dai(input [3:0] month,output d);

		assign d= month == 1 | month == 3 | month == 5 | month == 7 |
						month == 8 | month == 10| month == 12;

endmodule
