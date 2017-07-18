//mlp.v

//2017-6-4
//Nur3e

`include "stddef.h"

module mlp (
	input	wire					clk
);

wire	[`WordDataBus]	data_in_0;
wire	[`WordDataBus]	data_in_1;
wire	[`WordDataBus]	data_in_2;
wire	[`WordDataBus]	data_in_3;
wire	[`WordDataBus]	data_in_4;
wire	[`WordDataBus]	data_in_5;
wire	[`WordDataBus]	data_in_6;

wire					in_rdy;
wire					reset;

wire	[`WordDataBus]	net_out_0;
wire	[`WordDataBus]	net_out_1;
wire					net_rdy;

net	Net	(
	.clk		(clk),
	.in_rdy		(in_rdy),
	.reset		(reset),
	
	.data_in_0	(data_in_0),
	.data_in_1	(data_in_1),
	.data_in_2	(data_in_2),
	.data_in_3	(data_in_3),
	.data_in_4	(data_in_4),
	.data_in_5	(data_in_5),
	.data_in_6	(data_in_6),
	
	.net_out_0	(net_out_0),
	.net_out_1	(net_out_1),
	.net_rdy	(net_rdy)
);

iram IRAM	(
	.data_in_0	(data_in_0),
	.data_in_1	(data_in_1),
	.data_in_2	(data_in_2),
	.data_in_3	(data_in_3),
	.data_in_4	(data_in_4),
	.data_in_5	(data_in_5),
	.data_in_6	(data_in_6),
	
	.in_rdy		(in_rdy),
	.reset		(reset)
);

endmodule