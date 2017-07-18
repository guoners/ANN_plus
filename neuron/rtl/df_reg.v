//df_reg.v
//DataFetch Register

//2017-5-21
//Nur3e

`include "stddef.h"

module df_reg (
	input	wire					clk,
	input	wire					reset,
	input	wire					sel_rdy,
	
	input	wire	[`WordDataBus]	data_w_new,
	input	wire	[`WordDataBus]	data_i_new,
	
	output	reg		[`WordDataBus]	data_w,
	output	reg		[`WordDataBus]	data_i,
	output	reg						df_rdy

);
always @ ( posedge clk or negedge reset )
begin
	if ( ~reset)
	begin
		data_w <= #1 `DATA_WIDTH'h0;
		data_i <= #1 `DATA_WIDTH'h0;
		df_rdy <= #1 `DISABLE;
	end else
	
	if (~sel_rdy)
	begin
		data_w <= #1 `DATA_WIDTH'h0;
		data_i <= #1 `DATA_WIDTH'h0;
		df_rdy <= #1 `DISABLE;
	end else
	
	begin 
		data_w <= #1 data_w_new;
		data_i <= #1 data_i_new;
		df_rdy <= #1 sel_rdy;
	end
end

endmodule