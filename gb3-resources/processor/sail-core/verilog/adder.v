/*
	Authored 2018-2019, Ryan Voo.

	All rights reserved.
	Redistribution and use in source and binary forms, with or without
	modification, are permitted provided that the following conditions
	are met:

	*	Redistributions of source code must retain the above
		copyright notice, this list of conditions and the following
		disclaimer.

	*	Redistributions in binary form must reproduce the above
		copyright notice, this list of conditions and the following
		disclaimer in the documentation and/or other materials
		provided with the distribution.

	*	Neither the name of the author nor the names of its
		contributors may be used to endorse or promote products
		derived from this software without specific prior written
		permission.

	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
	"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
	LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
	FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
	COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
	INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
	BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
	LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
	CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
	LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
	ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
	POSSIBILITY OF SUCH DAMAGE.
*/



/*
 *	Description:
 *
 *		This module implements an adder for use by the branch unit
 *		and program counter increment among other things.
 */





module adder(input1, input2, out, clk);
	input [31:0]	input1;
	input [31:0]	input2;
	input clk;
	reg zero = 1'b0;
	reg one = 1'b1;
	output [31:0]	out;
	
	wire [2:0] trash;
	/*
	SB_MAC16 i_sbmac16 ( // port interfaces
		.A(input1[31:16]),
		.B(input1[15:0]),
		.C(input2[31:16]),
		.D(input2[15:0]),
		.O(out),
		.CLK(zero),
		.CE(one),
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
		.ADDSUBTOP(zero),
		.ADDSUBBOT(zero),
		.CO(trash[2]),
		.CI(zero),
		.ACCUMCI(),
		.ACCUMCO(),
		.SIGNEXTIN(),
		.SIGNEXTOUT()
	);
	
	
	
	defparam i_sbmac16.TOPADDSUB_UPPERINPUT = 1'b1;
	defparam i_sbmac16.TOPADDSUB_CARRYSELECT = 2'b10;
	defparam i_sbmac16.BOTADDSUB_UPPERINPUT = 1'b1;
	defparam i_sbmac16.A_SIGNED = 1'b1;
	defparam i_sbmac16.B_SIGNED = 1'b1;
	defparam i_sbmac16.MODE_8x8 = 1'b0;
	*/
	
	reg dsp_ce;
   reg [15:0] dsp_c;
   reg [15:0] dsp_a;
   reg [15:0] dsp_b;
   reg [15:0] dsp_d;
   reg dsp_irsttop;
   reg dsp_irstbot;
   reg dsp_orsttop;
   reg dsp_orstbot;
   reg dsp_ahold;
   reg dsp_bhold;
   reg dsp_chold;
   reg dsp_dhold;
   reg dsp_oholdtop;
   reg dsp_oholdbot;
   reg dsp_addsubtop;
   reg dsp_addsubbot;
   reg dsp_oloadtop;
   reg dsp_oloadbot;
   reg dsp_ci;

   wire [31:0] dsp_o;
   wire dsp_co;
	
	SB_MAC16 #(.C_REG(0), .A_REG(0), .B_REG(0), .D_REG(0), .TOP_8x8_MULT_REG(0), .BOT_8x8_MULT_REG(0),
            .PIPELINE_16x16_MULT_REG1(0), .PIPELINE_16x16_MULT_REG2(0), .TOPOUTPUT_SELECT(0), .TOPADDSUB_LOWERINPUT(0),
            .TOPADDSUB_UPPERINPUT(1), .TOPADDSUB_CARRYSELECT(2), .BOTOUTPUT_SELECT(0), .BOTADDSUB_LOWERINPUT(0), .BOTADDSUB_UPPERINPUT(1),
            .BOTADDSUB_CARRYSELECT(0), .MODE_8x8(1), .A_SIGNED(1), .B_SIGNED(1))
   i_sbmac16(
      .CLK(clk), .CE(dsp_ce), .C(dsp_c), .A(dsp_a), .B(dsp_b), .D(dsp_d),
      .IRSTTOP(dsp_irsttop), .IRSTBOT(dsp_irstbot), .ORSTTOP(dsp_orsttop), .ORSTBOT(dsp_orstbot),
      .AHOLD(dsp_ahold), .BHOLD(dsp_bhold), .CHOLD(dsp_chold), .DHOLD(dsp_dhold), .OHOLDTOP(dsp_oholdtop), .OHOLDBOT(dsp_oholdbot),
      .ADDSUBTOP(dsp_addsubtop), .ADDSUBBOT(dsp_addsubbot), .OLOADTOP(dsp_oloadtop), .OLOADBOT(dsp_oloadbot),
      .CI(dsp_ci), .O(dsp_o), .CO(dsp_co)
   );
	
	initial begin
		dsp_ce = 1;
	//dsp_c = 0;
		//dsp_a = 0;
		//dsp_b = 0;
		//dsp_d = 0;
		dsp_irsttop = 0;
		dsp_irstbot = 0;
		dsp_orsttop = 0;
		dsp_orstbot = 0;
		dsp_ahold = 0;
		dsp_bhold = 0;
		dsp_chold = 0;
		dsp_dhold = 0;
		dsp_oholdtop = 0;
		dsp_oholdbot = 0;
		dsp_addsubtop = 0;
		dsp_addsubbot = 0;
		dsp_oloadtop = 0;
		dsp_oloadbot = 0;
		dsp_ci = 0;
	end
	

	
	assign dsp_a = input1[31:16];
	assign dsp_b = input1[15:0];
	assign dsp_c = input2[31:16];
	assign dsp_d = input2[15:0];
	assign out = dsp_o;
	

	
	//assign		out = input1 + input2;
endmodule
