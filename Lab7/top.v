module top
(
  input [31:0]instruction,
  output reg [63:0]ReadData1, ReadData2
);

wire [4:0]rd;
wire [4:0]rs1;
wire [4:0]rs2;

instruction_parser ip1
(
  .instruction(instruction),
  .rd(rd),
  .rs1(rs1),
  .rs2(rs2)
);

registerFile rf1
(
  .RD(rd),
  .RS1(rs1),
  .RS2(rs2),
  .ReadData1(ReadData1),
  .ReadData2(ReadData2),
  .reset(0),
  .WrtieData(0)
);

endmodule