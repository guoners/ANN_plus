//df_cnt.v
//df.cnt
//counter form 0 to 7
//output as RAM address

//2017-5-19
//Nur3e

`include "stddef.h"

module df_cnt (
	input	wire					clk,
	input	wire					reset,
	input	wire					in_rdy,
	
	output	reg		[`WordAddrBus]	sel,
	output	reg						sel_rdy
);

always @ ( posedge clk or negedge reset)
begin
	if (~reset)
	begin
		sel 	<= #1 3'h7;
		sel_rdy	<= #1 `DISABLE;
	end else
	
	if (~in_rdy)
	begin
		sel 	<= #1 3'h7;
		sel_rdy	<= #1 `DISABLE;
	end else
	
	begin
		sel 	<= #1 sel + 3'h1;
		sel_rdy <= #1 in_rdy;
	end
end

endmodule