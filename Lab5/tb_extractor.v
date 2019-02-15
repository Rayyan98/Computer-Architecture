module tb_extractor
(
);

reg [31:0]instruction;
wire [63:0]imm_data;

imm_data id1
(
  .instruction(instruction),
  .imm_data(imm_data)
);

initial
begin
  instruction = {32'hFACADE, 8'b10011111};
  #300 instruction = {32'hDEAFAF, 8'b10111111};
  #300 instruction = {32'hFADEAF, 8'b11111111};
end

endmodule