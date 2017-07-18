//df_mux_o.v
//df.mux for output neuron
//8to1Mux

//2017-6-4
//Nur3e

`include	"stddef.h"

module df_mux_o (
	input 	wire					reset,
	
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
	
	input	wire	[`WordAddrBusO]	sel,	
	
	output	reg		[`WordDataBus]	data_i
);

always @ (*)
begin
	if ( ~reset )
		data_i <= #1 `DATA_WIDTH'h0;
	else
	
	begin
		case	(sel)
			3'h0	:
				data_i <= #1 data_in_0;
			3'h1	:
				data_i <= #1 data_in_1;
			3'h2	:
				data_i <= #1 data_in_2;
			3'h3	:
				data_i <= #1 data_in_3;
			3'h4	:
				data_i <= #1 data_in_4;
			3'h5	:
				data_i <= #1 data_in_5;
			3'h6	:
				data_i <= #1 data_in_6;
			3'h7	:
				data_i <= #1 data_in_7;
			3'h8	:
				data_i <= #1 data_in_8;
			3'h9	:
				data_i <= #1 data_in_9;
			3'ha	:
				data_i <= #1 data_in_a;
			3'hb	:
				data_i <= #1 data_in_b;
			3'hc	:
				data_i <= #1 data_in_c;
			3'hd	:
				data_i <= #1 data_in_d;
			3'he	:
				data_i <= #1 data_in_e;
			3'hf	:
				data_i <= #1 `DATA_WIDTH'h1000;	//const:1
		endcase
	end
end

endmodule
		