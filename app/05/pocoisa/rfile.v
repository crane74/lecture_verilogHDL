`include "def.h"
module rfile (
 input clk,
 input [`REG_W-1:0] aadr, badr, cadr,
 output [`DATA_W-1:0] a, b,
 input [`DATA_W-1:0] c, 
 input we);

	reg [`DATA_W-1:0] r0, r1, r2, r3, r4, r5, r6, r7;

	assign a = aadr == 0 ? r0:
		aadr == 1 ? r1:
		aadr == 2 ? r2:
		aadr == 3 ? r3:
		aadr == 4 ? r4:
		aadr == 5 ? r5:
		aadr == 6 ? r6: r7;
	assign b = badr == 0 ? r0:
		badr == 1 ? r1:
		badr == 2 ? r2:
		badr == 3 ? r3:
		badr == 4 ? r4:
		badr == 5 ? r5:
		badr == 6 ? r6: r7;

	always @(posedge clk) begin
		if(we) 
		case(cadr) 
			0: r0 <= c;
			1: r1 <= c;
			2: r2 <= c;
			3: r3 <= c;
			4: r4 <= c;
			5: r5 <= c;
			6: r6 <= c;
			default: r7 <= c;
		endcase
	end

endmodule
