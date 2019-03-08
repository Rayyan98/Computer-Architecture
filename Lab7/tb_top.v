module tb_top
(
);

reg [31:0]instruction;
wire [63:0]ReadData1, ReadData2;
reg clk, reset, RegWrite;
reg [63:0]WriteData;
  
top t1
(
  .instruction(instruction),
  .ReadData1(ReadData1),
  .ReadData2(ReadData2),
  .clk(clk),
  .reset(reset),
  .RegWrite(RegWrite),
  .WriteData(WriteData)
);

initial
begin
  clk <= 0;
  reset <= 0;
  RegWrite <= 0;
  WriteData <= 64'b0;
     instruction <= {7'b0, 5'b10101, 5'b01010, 3'b0, 5'b0 ,7'b0};
  #5 instruction <= {7'b0, 5'b01010, 5'b10101, 3'b0, 5'b0 ,7'b0};
  #5 instruction <= {7'b0, 5'b01110, 5'b10001, 3'b0, 5'b0 ,7'b0};
  #5 instruction <= {7'b0, 5'b10001, 5'b01110, 3'b0, 5'b0 ,7'b0};
  #5 instruction <= {7'b0, 5'b11111, 5'b00000, 3'b0, 5'b0 ,7'b0};
end

endmodule