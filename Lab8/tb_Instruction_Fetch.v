module tb_Instruction_Fetch
(
);

reg clk;
reg reset;
wire [31:0]Instruction;

Instruction_Fetch if1
(
  .clk(clk),
  .reset(reset),
  .Instruction(Instruction)
);

initial
begin
  clk = 1'b0;
  reset = 0;
  #35 reset = 1;
  #15 reset = 0;
end

always
begin
  #5 clk = ~clk;
end

endmodule