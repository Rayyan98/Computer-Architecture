module tb_Control_Unit
(
);

reg [6:0]Opcode;
wire Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
wire [1:0]ALUOp;

Control_Unit cu1
(
  .Branch(Branch),
  .MemRead(MemRead),
  .MemtoReg(MemtoReg),
  .MemWrite(MemWrite),
  .ALUSrc(ALUSrc),
  .RegWrite(RegWrite),
  .ALUOp(ALUOp),
  .Opcode(Opcode)
);

initial
begin
  Opcode <= 7'b0110011;
  #5   Opcode <= 7'b0000011;
  #5   Opcode <= 7'b0100011;
  #5   Opcode <= 7'b1100011;
end

endmodule