module subtractor(input1, input2, out);
	input [31:0]	input1;
	input [31:0]	input2;
	reg zero = 1'b0;
	reg one = 1'b1;
	output [31:0]	out;
	
	SB_MAC16 i_sbmac16 ( // port interfaces
		.A(input1[31:16]),
		.B(input1[15:0]),
		.C(input2[31:16]),
		.D(input2[15:0]),
		.O(out),
		.CLK(zero),
		.CE(zero),
		.IRSTTOP(zero),
		.IRSTBOT(zero),
		.ORSTTOP(zero),
		.ORSTBOT(zero),
		.AHOLD(zero),
		.BHOLD(zero),
		.CHOLD(zero),
		.DHOLD(zero),
		.OHOLDTOP(zero),
		.OHOLDBOT(zero),
		.OLOADTOP(zero),
		.OLOADBOT(zero),
		.ADDSUBTOP(one),
		.ADDSUBBOT(one),
		.CO(),
		.CI(zero),
		.ACCUMCI(),
		.ACCUMCO(),
		.SIGNEXTIN(),
		.SIGNEXTOUT()
	);
	
	
	defparam i_sbmac16.TOPADDSUB_UPPERINPUT = 1'b1;
	defparam i_sbmac16.TOPADDSUB_CARRYSELECT = 2'b10;
	defparam i_sbmac16.BOTADDSUB_UPPERINPUT = 1'b1;
	defparam i_sbmac16.MODE_8x8 = 1'b1;
	
endmodule