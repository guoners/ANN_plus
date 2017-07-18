//df.v
//data fetch
//fetch weights form WeightRAM(WRAM)
//fetch input from input register(IREG)

//2017-5-19
//Nur3e

`include "stddef.h"

module df (
	input	wire					clk,
	input	wire					reset,
	input	wire					in_rdy,
	
	input	wire	[`WordDataBus]	data_in_0,
	input	wire	[`WordDataBus]	data_in_1,
	input	wire	[`WordDataBus]	data_in_2,
	input	wire	[`WordDataBus]	data_in_3,
	input	wire	[`WordDataBus]	data_in_4,
	input	wire	[`WordDataBus]	data_in_5,
	input	wire	[`WordDataBus]	data_in_6,
	
	output	wire	[`WordDataBus]	data_w,
	output	wire	[`WordDataBus]	data_i,
	output	wire					df_rdy
);

assign	clk_ = ~clk;

wire	[`WordAddrBus]	sel;
wire					sel_rdy;
wire	[`WordDataBus]	data_w_new;
wire	[`WordDataBus]	data_i_new;

df_wram		WRAM	(
	.clk			(clk_),//tow way clock
	.addr			(sel),
	.out			(data_w_new)
);

df_cnt		Cnt		(
	.clk			(clk),
	.reset			(reset),
	.in_rdy			(in_rdy),
	
	.sel			(sel),
	.sel_rdy		(sel_rdy)
);

df_mux		Mux		(
	.reset			(reset),
	
	.data_in_0		(data_in_0),
	.data_in_1		(data_in_1),
	.data_in_2		(data_in_2),
	.data_in_3		(data_in_3),
	.data_in_4		(data_in_4),
	.data_in_5		(data_in_5),
	.data_in_6		(data_in_6),
	.sel			(sel),
	
	.data_i			(data_i_new)
);

df_reg		Df_Reg	(
	.clk			(clk),
	.reset			(reset),
	.sel_rdy		(sel_rdy),
	
	.data_w_new		(data_w_new),
	.data_i_new		(data_i_new),
		
	.data_w			(data_w),
	.data_i			(data_i),
	.df_rdy			(df_rdy)
);

endmodule
	

