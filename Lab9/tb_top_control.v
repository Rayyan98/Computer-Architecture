module tb_top_control
(
);


reg [6:0]Opcode;
reg [3:0]Funct;
wire [3:0]Operation;
wire Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;

top_control tc
(
  .Opcode(Opcode),
  .Funct(Funct),
  .Operation(Operation),
  .Branch(Branch),
  .MemRead(MemRead),
  .MemtoReg(MemtoReg),
  .MemWrite(MemWrite),
  .ALUSrc(ALUSrc),
  .RegWrite(RegWrite)
);

initial
begin
  Opcode <= 7'b0110011;
  Funct <= 4'b0000;
  
  #5 Funct <= 4'b1000;
  
  #5 Funct <= 4'b0111;  
  
  #5 Funct <= 4'b0110;
  
  #5   Opcode <= 7'b0000011;
  #5   Opcode <= 7'b0100011;
  #5   Opcode <= 7'b1100011;
end

endmodule