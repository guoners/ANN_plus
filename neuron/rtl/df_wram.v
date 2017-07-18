//df_wram.v
//Weight RAM(register)

//2017-5-21
//Nur3e

`include "stddef.h"

module df_wram (
	input	wire					clk,
	
	input	wire	[`WordAddrBus]	addr,

	output	reg		[`WordDataBus]	out
);

reg	[`WordDataBus]	mem[0:7];

always @ (posedge clk)
	out <= #1 mem[addr];
	
endmodule
	
	