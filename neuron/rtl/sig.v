//sig.v
//sigmoid function

//2017-5-21
//Nur3e

`include "stddef.h"

module	sig	(
	input	wire					reset,

	input	wire					mac_rdy,
	input	wire	[`WordDataBus]	mac_out,
	
	output	reg		[`WordDataBus]	sig_out,
	output	reg						sig_rdy
);

reg		[`WordDataBus]		data;
wire	[`INT_WIDTH-1:0]	int_ = data[14:12];
wire						sign = mac_out[15];

always @ ( * )
begin
	if ( ~reset || ~mac_rdy )
	begin
		sig_rdy <= #1 `DISABLE;
		sig_out	<= #1 `DATA_WIDTH'h0;
	end 
	
	else
	begin
	
		sig_rdy <= #1 `DISABLE;
	
		if ( sign == `HIGH )
		begin
			data <= #1 { sign, {~{mac_out[14:0]+15'h1}}};
		end else
		
		begin
			data <= #1 mac_out;
		end
			
		case	(int_)
			3'h0	:
			begin
				sig_out <= #1 {`LOW,5'b00010,{data[11:2]}};
			end
			
			3'h1	:
			begin
				sig_out	<= #1 {`LOW,6'b000110,{data[11:3]}};
			end
		
			3'h2	:
			begin
				sig_out	<= #1 {`LOW,7'b0001110,{data[11:4]}};
			end
				
			3'h3	:
			begin
				sig_out	<= #1 {`LOW,8'b00011110,{data[11:5]}};
			end
				
			3'h4	:
			begin
				sig_out <= #1 {`LOW,9'b000111110,{data[11:6]}};
			end
			
			3'h5	:
			begin
				sig_out <= #1 {`LOW,10'b0001111110,{data[11:7]}};
			end
				
			3'h6	:
			begin
				sig_out <= #1 {`LOW,11'b00011111110,{data[11:8]}};
			end
			
			3'h7	:
			begin
				sig_out <= #1 {`LOW,11'b00011111111,{data[11:8]}};
			end
		endcase
			
		if ( sign == `HIGH )
		begin
			sig_out <= #1 {4'b0,{~sig_out[11:0]}};
		end

		sig_rdy <= #1 `ENABLE;
	end
end

endmodule