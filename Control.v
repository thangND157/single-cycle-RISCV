module Control(inst, BrEq, BrLT, out);
input [31:0] inst;
input BrEq;
input BrLT;
output [17:0] out;

reg [17:0] out;

always @(*) begin
	casex({inst[30], inst[14:12], inst[6:2], BrEq, BrLT})
		// Nhom R
		11'b0_000_01100_x_x: out = 18'b0_xxx_1_x_0_0_0000_0000_01;
		11'b1_000_01100_x_x: out = 18'b0_xxx_1_x_0_0_0001_0000_01;
		11'b0_001_01100_x_x: out = 18'b0_xxx_1_x_0_0_0010_0000_01;
		11'b0_010_01100_x_x: out = 18'b0_xxx_1_x_0_0_0011_0000_01;
		11'b0_011_01100_x_x: out = 18'b0_xxx_1_x_0_0_0100_0000_01;
		11'b0_100_01100_x_x: out = 18'b0_xxx_1_x_0_0_0101_0000_01;
		11'b0_101_01100_x_x: out = 18'b0_xxx_1_x_0_0_0110_0000_01;
		11'b1_101_01100_x_x: out = 18'b0_xxx_1_x_0_0_0111_0000_01;
		11'b0_110_01100_x_x: out = 18'b0_xxx_1_x_0_0_1000_0000_01;
		11'b0_111_01100_x_x: out = 18'b0_xxx_1_x_0_0_1001_0000_01;
		// Nh�m I
		11'bx_000_00100_x_x: out = 18'b0_000_1_x_1_0_0000_0000_01;
		11'bx_010_00100_x_x: out = 18'b0_000_1_x_1_0_0011_0000_01;
		11'bx_011_00100_x_x: out = 18'b0_001_1_x_1_0_0100_0000_01;
		11'bx_100_00100_x_x: out = 18'b0_000_1_x_1_0_0101_0000_01;
		11'bx_110_00100_x_x: out = 18'b0_000_1_x_1_0_1000_0000_01;
		11'bx_111_00100_x_x: out = 18'b0_000_1_x_1_0_1001_0000_01;
		11'b0_001_00100_x_x: out = 18'b0_101_1_x_1_0_0010_0000_01;
		11'b0_101_00100_x_x: out = 18'b0_101_1_x_1_0_0110_0000_01;
		11'b1_101_00100_x_x: out = 18'b0_101_1_x_1_0_0111_0000_01;

		11'bx_000_00000_x_x: out = 18'b0_000_1_x_1_0_0000_0001_00;
		11'bx_001_00000_x_x: out = 18'b0_000_1_x_1_0_0000_0010_00;
		11'bx_010_00000_x_x: out = 18'b0_000_1_x_1_0_0000_0011_00;
		11'bx_100_00000_x_x: out = 18'b0_000_1_x_1_0_0000_0100_00;
		11'bx_101_00000_x_x: out = 18'b0_000_1_x_1_0_0000_0110_00;
		// Nhom S
		11'bx_000_01000_x_x: out = 18'b0_010_0_x_1_0_0000_1001_11;
		11'bx_001_01000_x_x: out = 18'b0_010_0_x_1_0_0000_1010_11;
		11'bx_010_01000_x_x: out = 18'b0_010_0_x_1_0_0000_1111_11;
		// Nhom B
		11'bx_000_11000_1_x: out = 18'b1_011_0_0_1_1_0000_0000_11;
		11'bx_000_11000_0_x: out = 18'b0_011_0_0_1_1_0000_0000_11;
		11'bx_001_11000_0_x: out = 18'b1_011_0_0_1_1_0000_0000_11;
		11'bx_001_11000_1_x: out = 18'b0_011_0_0_1_1_0000_0000_11;
		11'bx_100_11000_x_1: out = 18'b1_011_0_0_1_1_0000_0000_11;
		11'bx_100_11000_x_0: out = 18'b0_011_0_0_1_1_0000_0000_11;
		11'bx_101_11000_x_0: out = 18'b1_011_0_0_1_1_0000_0000_11;
		11'bx_101_11000_x_1: out = 18'b0_011_0_0_1_1_0000_0000_11;
		11'bx_110_11000_x_1: out = 18'b1_011_0_1_1_1_0000_0000_11;
		11'bx_110_11000_x_0: out = 18'b0_011_0_1_1_1_0000_0000_11;
		11'bx_111_11000_x_0: out = 18'b1_011_0_1_1_1_0000_0000_11;
		11'bx_111_11000_x_1: out = 18'b0_011_0_1_1_1_0000_0000_11;
		// Nhom U
		11'bx_xxx_01101_x_x: out = 18'b0_100_1_x_1_x_1010_0000_01;
		11'bx_xxx_00101_x_x: out = 18'b0_100_1_x_1_1_0000_0000_01;
		// Nhom J
		11'bx_xxx_11011_x_x: out = 18'b1_110_1_x_1_1_0000_0000_10;
		11'bx_000_11001_x_x: out = 18'b1_000_1_x_1_0_0000_0000_10;
	endcase
end

initial
	out = 18'b0;

endmodule