//standard definition

`ifndef __STDDEF_HEADER__
	`define __STDDEF_HEADER__
	
	`timescale 1 ps / 1 ps
	
	`define WordDataBus				15:0
	`define DWordDataBus			31:0	//DoubleWordData
	`define WordAddrBus				2:0
	`define WordAddrBusO			3:0
	
	`define DWORD_WIDTH				32
	`define DATA_WIDTH				16
	`define ADDR_WIDTH				3
	
	`define PointPos_Data			12
	`define PointPos_Weight			12
	`define INT_WIDTH				3
	//				[15,sign][14-12,integer][11-0,decimal]
	//in product:	[31,sign][30-24,integer][23-0,decimal]
	
	`define LOW						1'b0
	`define HIGH					1'b1
	
	`define ENABLE					1'b1
	`define DISABLE					1'b0

`endif