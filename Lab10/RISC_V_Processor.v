module RISC_V_Processor
(
  input clk, reset
);

wire [63:0]pc_in;
wire [63:0]pc_out;

Program_Counter pc1
(
  .PC_In(pc_in),
  .PC_Out(pc_out),
  .clk(clk),
  .reset(reset)
);

wire [31:0]im_out;

Instruction_Memory im1
(
  .Instr_Addr(pc_out),
  .Instruction(im_out)
);

wire [6:0]opcode;
wire [4:0]rd;
wire [2:0]funct3;
wire [4:0]rs1;
wire [4:0]rs2;
wire [6:0]funct7;

instruction_parser ip1
(
  .instruction(im_out),
  .opcode(opcode),
  .rd(rd),
  .funct3(funct3),
  .rs1(rs1),
  .rs2(rs2),
  .funct7(funct7)
);

reg [63:0]four;

initial
  four <= 64'b100;

wire [63:0]adder1;

Adder a1
(
  .a(pc_out),
  .b(four),
  .out(adder1)
);

wire Branch;
wire MemRead;
wire MemtoReg;
wire MemWrite;
wire ALUSrc;
wire RegWrite;
wire [1:0]ALUOp;


Control_Unit cu1
(
  .Opcode(opcode),
  .Branch(Branch),
  .MemRead(MemRead),
  .MemtoReg(MemtoReg),
  .MemWrite(MemWrite),
  .ALUSrc(ALUSrc),
  .RegWrite(RegWrite),
  .ALUOp(ALUOp)
);

wire [63:0]adder2;

wire [63:0]aluout;
wire aluzero;

Mux m1
(
  .a(adder1),
  .b(adder2),
  .sel(Branch & aluzero),
  .data(pc_in)
);

wire [63:0]m2out;
wire [63:0]readdata1;
wire [63:0]readdata2;


registerFile rf1
(
  .clk(clk),
  .reset(reset),
  .RegWrite(RegWrite),
  .RS1(rs1),
  .RS2(rs2),
  .RD(rd),
  .WriteData(m2out),
  .ReadData1(readdata1),
  .ReadData2(readdata2)
);

wire [63:0]immdata_out;

imm_data immdata1
(
  .instruction(im_out),
  .imm_data(immdata_out)
);

wire [63:0]m3_out;

Mux m3
(
  .a(readdata2),
  .b(immdata_out),
  .sel(ALUSrc),
  .data(m3_out)
);

wire [3:0]aluc_out;

ALU_Control alucon1
(
  .ALUOp(ALUOp),
  .Funct({im_out[30],im_out[14:12]}),
  .Operation(aluc_out)
);

Adder a2
(
  .a(pc_out),
  .b({immdata_out[62:0], 1'b0}),
  .out(adder2)
);

ALU_64_behave alu64
(
  .a(readdata1),
  .b(m3_out),
  .Operation(aluc_out),
  .Zero(aluzero),
  .Result(aluout)
);

wire [63:0]datamem_out;

Data_Memory datam
(
  .Mem_Addr(aluout),
  .Write_Data(readdata2),
  .clk(clk),
  .MemWrite(MemWrite),
  .MemRead(MemRead),
  .Read_Data(datamem_out)
);

Mux m2
(
  .a(aluout),
  .b(datamem_out),
  .sel(MemtoReg),
  .data(m2out)
);

endmodule