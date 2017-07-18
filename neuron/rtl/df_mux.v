//df_mux.v
//df.mux
//8to1Mux

//2017-5-11
//Nur3e

`include	"stddef.h"

module df_mux (
	input 	wire					reset,
	
	input	wire	[`WordDataBus]	data_in_0,
	input	wire	[`WordDataBus]	data_in_1,
	input	wire	[`WordDataBus]	data_in_2,
	input	wire	[`WordDataBus]	data_in_3,
	input	wire	[`WordDataBus]	data_in_4,
	input	wire	[`WordDataBus]	data_in_5,
	input	wire	[`WordDataBus]	data_in_6,
	
	input	wire	[`WordAddrBus]	sel,	
	
	output	reg		[`WordDataBus]	data_i
);

always @ (*)
begin
	if ( ~reset )
		data_i <= #1 `DATA_WIDTH'h0000;
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
				data_i <= #1 `DATA_WIDTH'h1000;	//const:1
		endcase
	end
end

endmodule
		