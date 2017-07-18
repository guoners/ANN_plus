//mac_ctrl_o.v
//count the num of ac_rdy, when equal to 8, output to sig
//for output neuron

//2017-6-4
//Nur3e

`include "stddef.h"

module mac_ctrl_o (
	input	wire					clk,
	input	wire					reset,
	input	wire					ac_rdy,
	input	wire	[`WordDataBus]	ac_out,
	input	wire					off,
	
	output	reg		[`WordDataBus]	mac_out,
	output	reg						mac_rdy
);

reg	[4:0]	mac_cnt;

always @ ( posedge clk or negedge reset )
begin
	if (~reset) 
	begin
		mac_out <= #1 `DATA_WIDTH'h0;
		mac_rdy <= #1 `DISABLE;
		mac_cnt <= #1 5'h0;
	end
	
	else if ( ~mac_rdy )
	begin
		if (mac_cnt == 5'h10)
		begin
			mac_out <= #1 mac_out;
			mac_rdy <= #1 `ENABLE;
		end
		
		else if ( ~ac_rdy )
		begin
			mac_out <= #1 mac_out;
			mac_rdy <= #1 ac_rdy;
		end
		
		else if ( off == `ENABLE )
		begin
			mac_out	<= #1 {mac_out[15],15'h7fff};
			mac_rdy <= #1 ac_rdy;
		end
		
		else
		begin
			mac_out <= #1 ac_out;
			mac_rdy <= #1 `DISABLE;
			mac_cnt <= #1 mac_cnt + 5'h1;
		end
	end
end

endmodule
			