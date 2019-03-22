module top_control
(
  input [6:0]Opcode,
  input [3:0]Funct,
  output wire Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite,
  output wire [3:0]Operation
);

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

ALU_Control ac
(
  .ALUOp(ALUOp),
  .Funct(Funct),
  .Operation(Operation)
);

endmodule