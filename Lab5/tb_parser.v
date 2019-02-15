module tb_parser
  (
  );
  
  reg [31:0]instruction;
  wire [6:0]opcode;
  wire [4:0]rd;
  wire [2:0]funct3;
  wire [4:0]rs1;
  wire [4:0]rs2; 
  wire [6:0]funct7;
  
  instruction_parser ps1
  (
    .instruction(instruction),
    .opcode(opcode),
    .rd(rd),
    .funct3(funct3),
    .rs1(rs1),
    .rs2(rs2),
    .funct7(funct7)
  );
  
  
  initial 
  begin
  instruction = 32'hAB13_45DE;
  #300 instruction = 32'h5676_AB3F;
  end

  initial 
  $monitor("Time = ", $time, "----> opcode = %d, rd = %d, funct3 = %d, rs1 = %d, rs2 = %d, funct7 = %d", opcode, rd, funct3, rs1,rs2,funct7);

endmodule