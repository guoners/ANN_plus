//stimulus_net.v
//TestBench for Neuron

//2017-6-4
//Nur3e

`include "stddef.h"

module stimulus_net;
reg clk, in_rdy, reset;

reg		[`WordDataBus]  input_test[0:6];
reg		[`WordDataBus]	in0, in1, in2, in3, in4, in5, in6;

wire	[`WordDataBus]	net_out_0;
wire	[`WordDataBus]	net_out_1;

wire					net_rdy;

net	Net (
	.clk		(clk),
	.in_rdy		(in_rdy),
	.reset		(reset),
	
	.data_in_0	(in0),
	.data_in_1	(in1),
	.data_in_2	(in2),
	.data_in_3	(in3),
	.data_in_4	(in4),
	.data_in_5	(in5),
	.data_in_6	(in6),
	
	.net_out_0	(net_out_0),
	.net_out_1	(net_out_1),
	.net_rdy	(net_rdy)
);

initial
begin
	$readmemb (
	"G:\\cloudComputing\\FPGA\\workspace\\ANN_plus\\sc\\testbench\\data\\w_h_test_neuron.dat",
	Net.h0.DF.WRAM.mem);
	
	$readmemb (
	"G:\\cloudComputing\\FPGA\\workspace\\ANN_plus\\sc\\testbench\\data\\w_h_test_neuron.dat",
	Net.h1.DF.WRAM.mem);
	
	$readmemb (
	"G:\\cloudComputing\\FPGA\\workspace\\ANN_plus\\sc\\testbench\\data\\w_h_test_neuron.dat",
	Net.h2.DF.WRAM.mem);
	
	$readmemb (
	"G:\\cloudComputing\\FPGA\\workspace\\ANN_plus\\sc\\testbench\\data\\w_h_test_neuron.dat",
	Net.h3.DF.WRAM.mem);
	
	$readmemb (
	"G:\\cloudComputing\\FPGA\\workspace\\ANN_plus\\sc\\testbench\\data\\w_h_test_neuron.dat",
	Net.h4.DF.WRAM.mem);
	
	$readmemb (
	"G:\\cloudComputing\\FPGA\\workspace\\ANN_plus\\sc\\testbench\\data\\w_h_test_neuron.dat",
	Net.h5.DF.WRAM.mem);
	
	$readmemb (
	"G:\\cloudComputing\\FPGA\\workspace\\ANN_plus\\sc\\testbench\\data\\w_h_test_neuron.dat",
	Net.h6.DF.WRAM.mem);
	
	$readmemb (
	"G:\\cloudComputing\\FPGA\\workspace\\ANN_plus\\sc\\testbench\\data\\w_h_test_neuron.dat",
	Net.h7.DF.WRAM.mem);
	
	$readmemb (
	"G:\\cloudComputing\\FPGA\\workspace\\ANN_plus\\sc\\testbench\\data\\w_h_test_neuron.dat",
	Net.h8.DF.WRAM.mem);
	
	$readmemb (
	"G:\\cloudComputing\\FPGA\\workspace\\ANN_plus\\sc\\testbench\\data\\w_h_test_neuron.dat",
	Net.h9.DF.WRAM.mem);
	
	$readmemb (
	"G:\\cloudComputing\\FPGA\\workspace\\ANN_plus\\sc\\testbench\\data\\w_h_test_neuron.dat",
	Net.ha.DF.WRAM.mem);
	
	$readmemb (
	"G:\\cloudComputing\\FPGA\\workspace\\ANN_plus\\sc\\testbench\\data\\w_h_test_neuron.dat",
	Net.hb.DF.WRAM.mem);
	
	$readmemb (
	"G:\\cloudComputing\\FPGA\\workspace\\ANN_plus\\sc\\testbench\\data\\w_h_test_neuron.dat",
	Net.hc.DF.WRAM.mem);
	
	$readmemb (
	"G:\\cloudComputing\\FPGA\\workspace\\ANN_plus\\sc\\testbench\\data\\w_h_test_neuron.dat",
	Net.hd.DF.WRAM.mem);
	
	$readmemb (
	"G:\\cloudComputing\\FPGA\\workspace\\ANN_plus\\sc\\testbench\\data\\w_h_test_neuron.dat",
	Net.he.DF.WRAM.mem);
	
	$readmemb (
	"G:\\cloudComputing\\FPGA\\workspace\\ANN_plus\\sc\\testbench\\data\\w_h_test_neuron.dat",
	Net.he.DF.WRAM.mem);
	
	$readmemb (
	"G:\\cloudComputing\\FPGA\\workspace\\ANN_plus\\sc\\testbench\\data\\w_h_test_neuron_o.dat",
	Net.o0.DF.WRAM.mem);
	
	$readmemb (
	"G:\\cloudComputing\\FPGA\\workspace\\ANN_plus\\sc\\testbench\\data\\w_h_test_neuron_o.dat",
	Net.o1.DF.WRAM.mem);
	
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
		in_rdy	= `LOW;
	#1 	reset 	= `LOW;
	#10 reset 	= `HIGH;
		in_rdy	= `HIGH;
end

endmodule