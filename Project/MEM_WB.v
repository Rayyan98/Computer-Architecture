module MEM_WB
(
  input [4:0]rd_in,
  input [63:0]alu_in,
  input [63:0]read_data_in,
  input [1:0]wb_in,

  input clk,
  input reset,
  
  output reg [4:0]rd_out,
  output reg  [63:0]alu_out,
  output reg  [63:0]read_data_out,
  output reg  [1:0]wb_out
);

always@(posedge clk, posedge reset)
begin
  if (reset)
    begin
    rd_out = 0;
  alu_out = 0;
  read_data_out = 0;
  wb_out = 0;
    end
  else
    begin
  rd_out = rd_in;
  alu_out = alu_in;
  read_data_out = read_data_in;
  wb_out = wb_in;
end
end

endmodule