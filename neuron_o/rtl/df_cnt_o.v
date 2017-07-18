//df_cnt_o.v
//df.cnt for output neuron
//counter form 0 to 7
//output as RAM address

//2017-6-4
//Nur3e

`include "stddef.h"

module df_cnt_o (
	input	wire					clk,
	input	wire					reset,
	input	wire					in_rdy,
	
	output	reg		[`WordAddrBusO]	sel,
	output	reg						sel_rdy
);

always @ ( posedge clk or negedge reset)
begin
	if (~reset)
	begin
		sel 	<= #1 4'hf;
		sel_rdy	<= #1 `DISABLE;
	end else
	
	if (~in_rdy)
	begin
		sel 	<= #1 4'hf;
		sel_rdy	<= #1 `DISABLE;
	end else
	
	begin
		sel 	<= #1 sel + 4'h1;
		sel_rdy <= #1 in_rdy;
	end
end

endmodule