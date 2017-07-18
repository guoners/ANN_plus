//stimulus_neuron.v
//Testbench for Neuron

//2017-5-26
//Nur3e

`include "stddef.h"

module stimulus_neuron;
reg clk, rdy, reset;

reg		[`WordDataBus]	input_test[0:6];
reg		[`WordDataBus]	in0, in1, in2, in3, in4, in5, in6;

wire	[`WordDataBus]	neu_out;
wire					neu_rdy;

neuron	Neuron	(
	.clk		(clk),
	.in_rdy		(rdy),
	.reset		(reset),
	.data_in_0	(in0),
	.data_in_1	(in1),
	.data_in_2	(in2),
	.data_in_3	(in3),
	.data_in_4	(in4),
	.data_in_5	(in5),
	.data_in_6	(in6),
	
	.neu_out	(neu_out),
	.neu_rdy	(neu_rdy)
);

initial
begin
	$readmemb (
	"G:\\cloudComputing\\FPGA\\workspace\\ANN_plus\\sc\\testbench\\data\\w_h_test_neuron.dat",
	Neuron.DF.WRAM.mem);
	
	$readmemb (
	"G:\\cloudComputing\\FPGA\\workspace\\ANN_plus\\sc\\testbench\\data\\data_in_test_neuron.dat",
	input_test);
	
	in0 = input_test[0];
	in1 = input_test[1];
	in2 = input_test[2];
	in3 = input_test[3];
	in4 = input_test[4];
	in5 = input_test[5];
	in6 = input_test[6];
end

initial
begin
	clk = 1'b0;
	forever #20 clk = ~clk;
end

initial
begin
		reset 	= `HIGH;
		rdy		= `LOW;
	#1 	reset 	= `LOW;
	#10 reset 	= `HIGH;
		rdy		= `HIGH;
end

endmodule