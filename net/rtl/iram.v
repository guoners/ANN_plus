//iram.v
//input RAM

//2017-6-4
//Nur3e

`include "stddef.h"

module iram (
	output	reg		[`WordDataBus]	data_in_0,
	output	reg		[`WordDataBus]	data_in_1,
	output	reg		[`WordDataBus]	data_in_2,
	output	reg		[`WordDataBus]	data_in_3,
	output	reg		[`WordDataBus]	data_in_4,
	output	reg		[`WordDataBus]	data_in_5,
	output	reg		[`WordDataBus]	data_in_6,
	
	output	reg						in_rdy,
	output	reg						reset
);

endmodule