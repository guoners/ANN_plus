//mu.v
//Multi Unit
//multi weight and data

//2017-5-21
//Nur3e

`include "stddef.h"

module mu (
	input	wire					clk,
	input	wire					reset,
	input	wire					df_rdy,
	
	input	wire	[`WordDataBus]	data_w,
	input	wire	[`WordDataBus]	data_i,
	
	output	wire					mu_rdy,
	output	wire	[`WordDataBus]	mu_out
);

wire	[`DWordDataBus]	mu_out_new_d;
wire	[`WordDataBus]	mu_out_new = {	mu_out_new_d[`DWORD_WIDTH-1],
										mu_out_new_d[26:12]};

Mult 	Multi	(
	.dataa		(data_i),
	.datab		(data_w),
	
	.result		(mu_out_new_d)
);

mu_reg	Mu_Reg	(
	.clk		(clk),
	.reset		(reset),
	
	.df_rdy		(df_rdy),
	
	.mu_out_new	(mu_out_new),
	
	.mu_rdy		(mu_rdy),
	.mu_out		(mu_out)
);

endmodule