//neuron_o.v

//specification:
//when input ready, change the 'in_rdy' signal,
//there will be logic to do so.

//keep the 'in_rdy' high, 
//of course keep the reset high too,
//until the compute is finished,
//which would spend aroud 10 time cycles

//then the output would be steady,
//unless the reset is set.

//and this output neuron is base on the neuron.v

//2017-6-4
//Nur3e

`include "stddef.h"

module neuron_o (
	input	wire					clk,
	input	wire					in_rdy,
	input	wire					reset,
	
	input	wire	[`WordDataBus]	data_in_0,
	input	wire	[`WordDataBus]	data_in_1,
	input	wire	[`WordDataBus]	data_in_2,
	input	wire	[`WordDataBus]	data_in_3,
	input	wire	[`WordDataBus]	data_in_4,
	input	wire	[`WordDataBus]	data_in_5,
	input	wire	[`WordDataBus]	data_in_6,
	input	wire	[`WordDataBus]	data_in_7,
	input	wire	[`WordDataBus]	data_in_8,
	input	wire	[`WordDataBus]	data_in_9,
	input	wire	[`WordDataBus]	data_in_a,
	input	wire	[`WordDataBus]	data_in_b,
	input	wire	[`WordDataBus]	data_in_c,
	input	wire	[`WordDataBus]	data_in_d,
	input	wire	[`WordDataBus]	data_in_e,
	
	output	wire	[`WordDataBus]	neu_out,
	output	wire					neu_rdy
);

wire	[`WordDataBus]	data_w;
wire	[`WordDataBus]	data_i;

wire	[`WordDataBus]	mu_out;
wire	[`WordDataBus]	ac_out;
wire	[`WordDataBus]	mac_out;

wire					df_rdy;
wire					mu_rdy;
wire					ac_rdy;
wire					mac_rdy;

wire					ac_off;

df_o	DF	(
	.clk		(clk),
	.reset		(reset),
	.in_rdy		(in_rdy),
	
	.data_in_0	(data_in_0),
	.data_in_1	(data_in_1),
	.data_in_2	(data_in_2),
	.data_in_3	(data_in_3),
	.data_in_4	(data_in_4),
	.data_in_5	(data_in_5),
	.data_in_6	(data_in_6),
	.data_in_7	(data_in_7),
	.data_in_8	(data_in_8),
	.data_in_9	(data_in_9),
	.data_in_a	(data_in_a),
	.data_in_b	(data_in_b),
	.data_in_c	(data_in_c),
	.data_in_d	(data_in_d),
	.data_in_e	(data_in_e),
	
	.data_w		(data_w),
	.data_i		(data_i),
	.df_rdy		(df_rdy)
);

mu	MU	(
	.clk		(clk),
	.reset		(reset),
	.df_rdy		(df_rdy),
	
	.data_w		(data_w),
	.data_i		(data_i),
	
	.mu_rdy		(mu_rdy),
	.mu_out		(mu_out)
);

ac	AC	(
	.clk		(clk),
	.reset		(reset),
	.mu_rdy		(mu_rdy),
	
	.mu_out		(mu_out),
	.ac_out		(ac_out),
	
	.ac_rdy		(ac_rdy),
	.off		(ac_off)
);

mac_ctrl_o	Mac_Ctrl	(
	.clk		(clk),
	.reset		(reset),
	
	.ac_rdy		(ac_rdy),
	.ac_out		(ac_out),
	.off		(ac_off),
	
	.mac_out	(mac_out),
	.mac_rdy	(mac_rdy)
);

sig	SIG	(
	.reset		(reset),
	
	.mac_rdy	(mac_rdy),
	.mac_out	(mac_out),
	
	.sig_out	(neu_out),
	.sig_rdy	(neu_rdy)
);

endmodule