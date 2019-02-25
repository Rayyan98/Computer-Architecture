module tb_ALU64
(
);

reg [63:0]a,b;
reg [3:0]Operation;
wire [63:0]Result;
wire Zero;

ALU_64_behave alu641
(
  .a(a),
  .b(b),
  .Result(Result),
  .Operation(Operation),
  .Zero(Zero)
);

initial 
begin
a = 64'h24;
b = 64'h37;
Operation = 4'b0000;
end

always
#10 Operation = Operation + 1;

endmodule