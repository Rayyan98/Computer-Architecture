module Instruction_Memory
(
  input [63:0]Instr_Addr,
  output reg [31:0]Instruction
);

reg [7:0]regs[15:0];

integer index = 0;

initial
begin
for(index = 0; index < 16; index = index + 1)
  begin
    regs[index] = index;
  end
end

always @ (Instr_Addr)
begin
  Instruction = {regs[Instr_Addr + 2'b11], regs[Instr_Addr + 2'b10], regs[Instr_Addr + 1'b1], regs[Instr_Addr]};
end

endmodule