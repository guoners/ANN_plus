//df_wram_o.v
//Weight RAM(register)

//2017-6-4
//Nur3e

`include "stddef.h"

module df_wram_o (
	input	wire					clk,
	
	input	wire	[`WordAddrBusO]	addr,

	output	reg		[`WordDataBus]	out
);

reg	[`WordDataBus]	mem[0:15];

always @ (posedge clk)
	out <= #1 mem[addr];
	
endmodule
	
	