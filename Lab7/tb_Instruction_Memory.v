module tb_Instruction_Memory
(

);

reg [63:0]Instr_Addr;
wire [31:0]Instruction;

Instruction_Memory im1
(
  .Instr_Addr(Instr_Addr),
  .Instruction(Instruction)
);

initial
begin
  Instr_Addr = 64'b0;
  #5 Instr_Addr = Instr_Addr+64'b100;
  #5 Instr_Addr = Instr_Addr+64'b100;
  #5 Instr_Addr = Instr_Addr+64'b100;
end

endmodule