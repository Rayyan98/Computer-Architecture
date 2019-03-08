module top
(
  input [31:0]instruction,
  input clk, reset, RegWrite,
  output wire [63:0]ReadData1, ReadData2,
  input [63:0]WriteData
);

wire [4:0]rd;
wire [4:0]rs1;
wire [4:0]rs2;
wire [6:0]opcode;
wire [2:0]funct3; 
wire [6:0]funct7;


instruction_parser ip1
(
  .instruction(instruction),
  .rd(rd),
  .rs1(rs1),
  .rs2(rs2),
  .opcode(opcode),
  .funct3(funct3),
  .funct7(funct7)
);

registerFile rf1
(
  .RD(rd),
  .RS1(rs1),
  .RS2(rs2),
  .ReadData1(ReadData1),
  .ReadData2(ReadData2),
  .reset(reset),
  .WriteData(WriteData),
  .clk(clk),
  .RegWrite(RegWrite)
);

endmodule
