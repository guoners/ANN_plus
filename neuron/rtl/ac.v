//ac.v
//accumulator stage

//2017-5-21
//Nur3e

`include "stddef.h"

module ac (
	input	wire					clk,
	input	wire					reset,
	input	wire					mu_rdy,
	
	input	wire	[`WordDataBus]	mu_out,//production in
	output	wire	[`WordDataBus]	ac_out,
	
	output	wire					ac_rdy,
	output	wire					off
);

wire	[`WordDataBus]	ac_out_new;
wire					off_new;

ADDer	Adder	(
	.dataa		(ac_out),
	.datab		(mu_out),
	.overflow	(off_new),
	.result		(ac_out_new)
);

ac_reg	Ac_Reg	(
	.clk		(clk),
	.reset		(reset),
	
	.mu_rdy		(mu_rdy),
	.off_new	(off_new),
	
	.ac_out_new	(ac_out_new),
	
	.ac_out		(ac_out),
	.ac_rdy		(ac_rdy),
	.off		(off)
);

endmodule