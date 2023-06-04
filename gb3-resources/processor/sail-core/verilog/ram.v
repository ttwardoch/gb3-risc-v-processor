module ram1 (din, addr, write_en, clk, dout);// 512x8
	parameter addr_width = 9;
	parameter data_width = 8;
	input [addr_width-1:0] addr;
	input [data_width-1:0] din;
	input write_en, clk;
	output [data_width-1:0] dout;
	
	reg [data_width-1:0] dout; // Register for output.
	reg [data_width-1:0] mem [(1<<addr_width)-1:0];
	
	initial begin
		/*
		 *	read from "program.hex" and store the instructions in instruction memory
		 */
		$readmemh("program1.hex",mem);
	end
	
	always @(posedge clk)
		begin
			if (write_en)
				mem[(addr)] <= din;
		dout = mem[addr]; // Output register controlled by clock.
		end
endmodule

module ram2 (din, addr, write_en, clk, dout);// 512x8
	parameter addr_width = 9;
	parameter data_width = 8;
	input [addr_width-1:0] addr;
	input [data_width-1:0] din;
	input write_en, clk;
	output [data_width-1:0] dout;
	
	reg [data_width-1:0] dout; // Register for output.
	reg [data_width-1:0] mem [(1<<addr_width)-1:0];
	
	initial begin
		/*
		 *	read from "program.hex" and store the instructions in instruction memory
		 */
		$readmemh("program2.hex",mem);
	end
	
	always @(posedge clk)
		begin
			if (write_en)
				mem[(addr)] <= din;
		dout = mem[addr]; // Output register controlled by clock.
		end
endmodule

module ram3 (din, addr, write_en, clk, dout);// 512x8
	parameter addr_width = 9;
	parameter data_width = 8;
	input [addr_width-1:0] addr;
	input [data_width-1:0] din;
	input write_en, clk;
	output [data_width-1:0] dout;
	
	reg [data_width-1:0] dout; // Register for output.
	reg [data_width-1:0] mem [(1<<addr_width)-1:0];
	
	initial begin
		/*
		 *	read from "program.hex" and store the instructions in instruction memory
		 */
		$readmemh("program3.hex",mem);
	end
	
	always @(posedge clk)
		begin
			if (write_en)
				mem[(addr)] <= din;
		dout = mem[addr]; // Output register controlled by clock.
		end
endmodule

module ram4 (din, addr, write_en, clk, dout);// 512x8
	parameter addr_width = 9;
	parameter data_width = 8;
	input [addr_width-1:0] addr;
	input [data_width-1:0] din;
	input write_en, clk;
	output [data_width-1:0] dout;
	
	reg [data_width-1:0] dout; // Register for output.
	reg [data_width-1:0] mem [(1<<addr_width)-1:0];
	
	initial begin
		/*
		 *	read from "program.hex" and store the instructions in instruction memory
		 */
		$readmemh("program4.hex",mem);
	end
	
	always @(posedge clk)
		begin
			if (write_en)
				mem[(addr)] <= din;
		dout = mem[addr]; // Output register controlled by clock.
		end
endmodule

module ram_512x32 (addr, clk, dout);
	input [31:0] addr;
	input clk;
	output [31:0] dout;
	
	ram1 ram_1(.din(),
			.addr(addr[8:0]),
			.write_en(1'b0),
			.clk(clk),
			.dout(dout[7:0])
	);
	
	ram2 ram_2(.din(),
			.addr(addr[8:0]),
			.write_en(1'b0),
			.clk(clk),
			.dout(dout[15:8])
	);
	
	ram3 ram_3(.din(),
			.addr(addr[8:0]),
			.write_en(1'b0),
			.clk(clk),
			.dout(dout[23:16])
	);
	
	ram4 ram_4(.din(),
			.addr(addr[8:0]),
			.write_en(1'b0),
			.clk(clk),
			.dout(dout[31:24])
	);
endmodule