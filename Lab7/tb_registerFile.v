module tb_registerFile
(
);

reg clk, reset, RegWrite;
reg [4:0]RS1, RS2, RD;
reg [63:0]WriteData;
wire [63:0]ReadData1, ReadData2;

registerFile rf1
(
  .clk(clk),
  .reset(reset),
  .RegWrite(RegWrite),
  .RS1(RS1),
  .RS2(RS2),
  .RD(RD),
  .WriteData(WriteData),
  .ReadData1(ReadData1),
  .ReadData2(ReadData2)
);

initial
begin
  clk = 1'b0;
  reset = 1'b0;
  RegWrite = 1'b0;
  RS1 = 5'b101;
  RS2 = 5'b1101;
  RD = 5'b01111;
  WriteData = 64'hFFFF_FFFF_FFFF_0000;

  #5 clk = ~clk;
  #1 RS1 = 5'b001;
     RS2 = 5'b101;  
  #4 clk = ~clk;
  #1 RS1 = 5'b1111;
     RS2 = 5'b1010;  

  #1  reset = 1'b1;
  #3 clk = ~clk;
  
  #1 reset = 1'b0;
  #4 clk = ~clk;
  
  #1 RD = 5'b011;
     WriteData = 64'hFFFF_FFFF_FFFF_FFFF;
     RegWrite = 1'b1;
  #3 clk = ~clk;
  #1 RegWrite = 1'b0;
  #5 clk = ~clk;
  
  #1 RS1 = 5'b011;
  
  #1 RD = 5'b0;
     WriteData = 64'hFFFF_FFFF_0000_FFFF;
     RegWrite = 1'b1;
  #3 clk = ~clk;
  
  #1 RegWrite = 1'b0;
     RS1 = 5'b0;
  
end
endmodule