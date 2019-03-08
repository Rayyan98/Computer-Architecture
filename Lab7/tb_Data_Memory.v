module tb_Data_Memory
(
);

reg clk, MemRead, MemWrite;
reg [63:0]Mem_Addr, Write_Data;
wire [63:0]Read_Data;

Data_Memory dm1
(
  .clk(clk),
  .MemRead(MemRead),
  .MemWrite(MemWrite),
  .Read_Data(Read_Data),
  .Mem_Addr(Mem_Addr),
  .Write_Data(Write_Data)
);

initial
begin
  clk = 0;
  MemRead = 1;
  MemWrite = 0;
  Mem_Addr = 64'b10101;
  Write_Data = 64'b0;
  
  #1 MemRead = 0;
  #4 clk = ~clk;
  
  #1 MemRead = 1;
  #4 clk = ~clk;
  
  #1 Mem_Addr = 64'b0001;
  #4 clk = ~clk;
  
  #1 Write_Data = 64'hFFFF_FFFF_FFFF_FFFF;
     MemWrite = 1;
  
  #4 clk = ~clk;
  #5 clk = ~clk;

end
endmodule