module dsp_register(
			inData,
			outData,
			clk
		);
	
	input clk;
	input [31:0] inData;
	output [31:0] outData;
	
	reg zero = 1'b0;
	reg one = 1'b1;
		
	SB_MAC16 i_sbmac16_2 (
		.A(),
		.B(),
		.C(inData[31:16]),
		.D(inData[15:0]),
		.O(outData),
		.CLK(clk),
		.CE(one),
		.IRSTTOP(zero),
		.IRSTBOT(zero),
		.ORSTTOP(zero),
		.ORSTBOT(zero),
		.AHOLD(one),
		.BHOLD(one),
		.CHOLD(zero),
		.DHOLD(zero),
		.OHOLDTOP(one),
		.OHOLDBOT(one),
		.OLOADTOP(one),
		.OLOADBOT(one),
		.ADDSUBTOP(zero),
		.ADDSUBBOT(zero),
		.CO(),
		.CI(zero),
		.ACCUMCI(zero),
		.ACCUMCO(),
		.SIGNEXTIN(zero),
		.SIGNEXTOUT()
	);
	
	defparam i_sbmac16_2.TOPADDSUB_UPPERINPUT = 1'b1;
	defparam i_sbmac16_2.TOPADDSUB_CARRYSELECT = 2'b10;
	defparam i_sbmac16_2.BOTADDSUB_UPPERINPUT = 1'b1;
	defparam i_sbmac16_2.A_REG = 1'b1;
	defparam i_sbmac16_2.B_REG = 1'b1;
	defparam i_sbmac16_2.C_REG = 1'b1;
	defparam i_sbmac16_2.D_REG = 1'b1;
	defparam i_sbmac16_2.MODE_8x8 = 1'b1;
	
endmodule