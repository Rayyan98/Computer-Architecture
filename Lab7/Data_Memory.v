module Data_Memory
(
  input [63:0]Mem_Addr, Write_Data,
  input clk, MemWrite, MemRead,
  output reg [63:0] Read_Data
);

reg [7:0]regs[63:0];

integer index;

initial
begin
for(index = 0; index < 64; index = index + 1)
  begin
    regs[index] = index;
  end
end

always@(posedge clk)
begin
  if(MemWrite)
    begin
      regs[Mem_Addr + 4'h7] = Write_Data[63:56];
      regs[Mem_Addr + 4'h6] = Write_Data[55:48];
      regs[Mem_Addr + 4'h5] = Write_Data[47:40];
      regs[Mem_Addr + 4'h4] = Write_Data[39:32];
      regs[Mem_Addr + 4'h3] = Write_Data[31:24];
      regs[Mem_Addr + 4'h2] = Write_Data[23:16];
      regs[Mem_Addr + 4'h1] = Write_Data[15:8];
      regs[Mem_Addr]     = Write_Data[7:0];
    end
end

always@(Mem_Addr, MemRead, clk)
begin
  if(MemRead)
    begin
      Read_Data <= {regs[Mem_Addr + 4'h7] , regs[Mem_Addr + 4'h6] , regs[Mem_Addr + 4'h5] , regs[Mem_Addr + 4'h4] , 
                  regs[Mem_Addr + 4'h3] , regs[Mem_Addr + 4'h2] , regs[Mem_Addr + 4'h1] , regs[Mem_Addr]};
    end
  else
    begin
      Read_Data <= 64'b0;
    end
end

endmodule