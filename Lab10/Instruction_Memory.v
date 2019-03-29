module Instruction_Memory
(
  input [63:0]Instr_Addr,
  output reg [31:0]Instruction
);

reg [7:0]regs[15:0];

initial
begin
regs[15] = 8'b00000010;
regs[14] = 8'b10010101;
regs[13] = 8'b00110100;
regs[12] = 8'b00100011;
regs[11] = 8'b00000000;
regs[10] = 8'b00010100;
regs[9] = 8'b10000100;
regs[8] = 8'b10010011;
regs[7] = 8'b00000000;
regs[6] = 8'b10011010;
regs[5] = 8'b10000100;
regs[4] = 8'b10110011;
regs[3] = 8'b00000010;
regs[2] = 8'b10000101;
regs[1] = 8'b00110100;
regs[0] = 8'b10000011;
end

always @ (Instr_Addr)
begin
  Instruction = {regs[Instr_Addr + 2'b11], regs[Instr_Addr + 2'b10], regs[Instr_Addr + 1'b1], regs[Instr_Addr]};
end

endmodule