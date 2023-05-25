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
 *	RISC-V CONTROL UNIT
 */
module control(
		opcode,
		MemtoReg,
		RegWrite,
		MemWrite,
		MemRead,
		Branch,
		ALUSrc,
		Jump,
		Jalr,
		Lui,
		Auipc,
		Fence,
		CSRR
	);

	input	[6:0] opcode;
	output	MemtoReg, RegWrite, MemWrite, MemRead, Branch, ALUSrc, Jump, Jalr, Lui, Auipc, Fence, CSRR;

	SB_LUT4     SB_LUT4_inst2 (
			.O (O2),
			.I0 (opcode[4]),
			.I1 (opcode[5]),
			.I2 (opcode[6]),
			.I3 (1)
			);

	defparam SB_LUT4_inst.LUT_INIT=16'hxxxx;

	assign MemtoReg = (~opcode[5]) & (~opcode[4]) & (~opcode[3]) & (opcode[0]);
	assign RegWrite = ((~(opcode[4] | opcode[5])) | opcode[2] | opcode[4]) & opcode[0];
	assign MemWrite = LUT_INIT[2] | LUT_INIT[10];
	assign MemRead = (~opcode[5]) & (~opcode[4]) & (~opcode[3]) & (opcode[1]);
	assign Branch = (opcode[6]) & (~opcode[4]) & (~opcode[2]);
	assign ALUSrc = ~(opcode[6] | opcode[4]) | (~opcode[5]);
	assign Jump = LUT_INIT[14] & (opcode[2]);
	assign Jalr = LUT_INIT[14] & (~opcode[3]) & (opcode[2]);
	assign Lui = LUT_INIT[11] & (~opcode[3]) & (opcode[2]);
	assign Auipc = LUT_INIT[9] & (~opcode[3]) & (opcode[2]);
	assign Fence = (~opcode[5]) & opcode[3] & (opcode[2]);
	assign CSRR = LUT_INIT[5] | LUT_INIT[7] | LUT_INIT[13] | LUT_INIT[15];
endmodule
