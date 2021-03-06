//mu_reg.v
//multi stage register

//2017-5-21
//Nur3e

`include "stddef.h"

module mu_reg (
	input	wire					clk,
	input	wire					reset,
	
	input 	wire					df_rdy,
	
	input	wire	[`WordDataBus]	mu_out_new,
	
	output	reg						mu_rdy,
	output	reg		[`WordDataBus]	mu_out
);

always @ ( posedge clk or negedge reset )
begin
	if ( ~reset )
	begin
		mu_out <= #1 `DATA_WIDTH'h0;
		mu_rdy <= #1 `DISABLE;
	end else
	
	if ( ~df_rdy )
	begin
		mu_out <= #1 `DATA_WIDTH'h0;
		mu_rdy <= #1 `DISABLE;
	end else
	 
	begin	
		mu_out	<= #1 mu_out_new;
		mu_rdy	<= #1 df_rdy;
	end
end

endmodule