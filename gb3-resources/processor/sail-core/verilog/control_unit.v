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
	input 			clk;
	output	MemtoReg, RegWrite, MemWrite, MemRead, Branch, ALUSrc, Jump, Jalr, Lui, Auipc, Fence, CSRR;



	always @(posedge clk) begin
		MemtoReg = (~opcode[5]) & (~opcode[4]) & (~opcode[3]) & (opcode[0]);
		RegWrite = ((~(opcode[4] | opcode[5])) | opcode[2] | opcode[4]) & opcode[0];
		MemWrite = (~opcode[6]) & (opcode[5]) & (~opcode[4]);
		MemRead = (~opcode[5]) & (~opcode[4]) & (~opcode[3]) & (opcode[1]);
		Branch = (opcode[6]) & (~opcode[4]) & (~opcode[2]);
		ALUSrc = ~(opcode[6] | opcode[4]) | (~opcode[5]);
		Jump = (opcode[6]) & (opcode[5]) & (~opcode[4]) & (opcode[2]);
		Jalr = (opcode[6]) & (opcode[5]) & (~opcode[4]) & (~opcode[3]) & (opcode[2]);
		Lui = (~opcode[6]) & (opcode[5]) & (opcode[4]) & (~opcode[3]) & (opcode[2]);
		Auipc = (~opcode[6]) & (~opcode[5]) & (opcode[4]) & (~opcode[3]) & (opcode[2]);
		Fence = (~opcode[5]) & opcode[3] & (opcode[2]);
		CSRR = (opcode[6]) & (opcode[4]);
	end




	
endmodule
