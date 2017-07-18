//net.v

//for MultiLayerP...
//8->16->2

//2017-6-4
//Nur3e

`include "stddef.h"

module net (
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
	
	output	wire	[`WordDataBus]	net_out_0,
	output	wire	[`WordDataBus]	net_out_1,
	output	wire					net_rdy
);

wire	[`WordDataBus]	neu_out_0;
wire	[`WordDataBus]	neu_out_1;
wire	[`WordDataBus]	neu_out_2;
wire	[`WordDataBus]	neu_out_3;
wire	[`WordDataBus]	neu_out_4;
wire	[`WordDataBus]	neu_out_5;
wire	[`WordDataBus]	neu_out_6;
wire	[`WordDataBus]	neu_out_7;
wire	[`WordDataBus]	neu_out_8;
wire	[`WordDataBus]	neu_out_9;
wire	[`WordDataBus]	neu_out_a;
wire	[`WordDataBus]	neu_out_b;
wire	[`WordDataBus]	neu_out_c;
wire	[`WordDataBus]	neu_out_d;
wire	[`WordDataBus]	neu_out_e;

wire	[14:0]			neu_rdy;

wire					in_rdy_o = &neu_rdy;

wire					net_rdy_0;
wire					net_rdy_1;

assign	net_rdy	= net_rdy_0 & net_rdy_1;

neuron	h0	(
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
	
	.neu_out	(neu_out_0),
	.neu_rdy	(neu_rdy[0])
);

neuron	h1	(
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
	
	.neu_out	(neu_out_1),
	.neu_rdy	(neu_rdy[1])
);

neuron	h2	(
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
	
	.neu_out	(neu_out_2),
	.neu_rdy	(neu_rdy[2])
);

neuron	h3	(
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
	
	.neu_out	(neu_out_3),
	.neu_rdy	(neu_rdy[3])
);

neuron	h4	(
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
	
	.neu_out	(neu_out_4),
	.neu_rdy	(neu_rdy[4])
);

neuron	h5	(
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
	
	.neu_out	(neu_out_5),
	.neu_rdy	(neu_rdy[5])
);

neuron	h6	(
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
	
	.neu_out	(neu_out_6),
	.neu_rdy	(neu_rdy[6])
);

neuron	h7	(
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
	
	.neu_out	(neu_out_7),
	.neu_rdy	(neu_rdy[7])
);

neuron	h8	(
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
	
	.neu_out	(neu_out_8),
	.neu_rdy	(neu_rdy[8])
);

neuron	h9	(
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
	
	.neu_out	(neu_out_9),
	.neu_rdy	(neu_rdy[9])
);

neuron	ha	(
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
	
	.neu_out	(neu_out_a),
	.neu_rdy	(neu_rdy[10])
);

neuron	hb	(
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
	
	.neu_out	(neu_out_b),
	.neu_rdy	(neu_rdy[11])
);

neuron	hc	(
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
	
	.neu_out	(neu_out_c),
	.neu_rdy	(neu_rdy[12])
);

neuron	hd	(
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
	
	.neu_out	(neu_out_d),
	.neu_rdy	(neu_rdy[13])
);

neuron	he	(
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
	
	.neu_out	(neu_out_e),
	.neu_rdy	(neu_rdy[14])
);

neuron_o	o0	(
	.clk		(clk),
	.in_rdy		(in_rdy_o),
	.reset		(reset),
	
	.data_in_0	(neu_out_0),
	.data_in_1	(neu_out_1),
	.data_in_2	(neu_out_2),
	.data_in_3	(neu_out_3),
	.data_in_4	(neu_out_4),
	.data_in_5	(neu_out_5),
	.data_in_6	(neu_out_6),
	.data_in_7	(neu_out_7),
	.data_in_8	(neu_out_8),
	.data_in_9	(neu_out_9),
	.data_in_a	(neu_out_a),
	.data_in_b	(neu_out_b),
	.data_in_c	(neu_out_c),
	.data_in_d	(neu_out_d),
	.data_in_e	(neu_out_e),
	
	.neu_out	(net_out_0),
	.neu_rdy	(net_rdy_0)
);

neuron_o	o1	(
	.clk		(clk),
	.in_rdy		(in_rdy_o),
	.reset		(reset),
	
	.data_in_0	(neu_out_0),
	.data_in_1	(neu_out_1),
	.data_in_2	(neu_out_2),
	.data_in_3	(neu_out_3),
	.data_in_4	(neu_out_4),
	.data_in_5	(neu_out_5),
	.data_in_6	(neu_out_6),
	.data_in_7	(neu_out_7),
	.data_in_8	(neu_out_8),
	.data_in_9	(neu_out_9),
	.data_in_a	(neu_out_a),
	.data_in_b	(neu_out_b),
	.data_in_c	(neu_out_c),
	.data_in_d	(neu_out_d),
	.data_in_e	(neu_out_e),
	
	.neu_out	(net_out_1),
	.neu_rdy	(net_rdy_1)
);

endmodule