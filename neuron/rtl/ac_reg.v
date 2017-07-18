//ac_reg.v
//accumulate stage register

//2017-5-27
//Nur3e

`include "stddef.h"

module ac_reg (
	input	wire					clk,
	input	wire					reset,
	
	input	wire					mu_rdy,
	input	wire					off_new,
	
	input	wire	[`WordDataBus]	ac_out_new,
	
	output	reg		[`WordDataBus]	ac_out,
	output	reg						ac_rdy,
	output	reg						off
);

always @ ( posedge clk or negedge reset )
begin
	if ( ~reset)
	begin
		ac_out 	<= #1 `DATA_WIDTH'h0;
		ac_rdy 	<= #1 `DISABLE;
		off	   	<= #1 `DISABLE;
	end
	
	else if ( ~mu_rdy )
	begin
		ac_out 	<= #1 ac_out;
		ac_rdy 	<= #1 `DISABLE;
		off	   	<= #1 `DISABLE;
	end 
	
	else
	begin
		ac_out 	<= #1 ac_out_new;
		ac_rdy 	<= #1 mu_rdy;
		off	   	<= #1 off_new;
	end
end

endmodule