module Instruction_Fetch
(
  input clk, reset,
  output [31:0]Instruction
);

wire [63:0]PC_Out;
reg  [63:0]four;
wire [63:0]out;

initial
four <= 64'd4;

Program_Counter pc1
(
  .clk(clk),
  .reset(reset),
  .PC_In(out),
  .PC_Out(PC_Out)
);

Adder a1
(
  .a(PC_Out),
  .b(four),
  .out(out)
);

Instruction_Memory m1
(
  .Instr_Addr(PC_Out),
  .Instruction(Instruction)
);

endmodule