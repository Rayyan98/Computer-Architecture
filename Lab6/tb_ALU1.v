module tb_ALU1
(
);

reg a,b,carryin;
reg [3:0]ALUOp;
wire result, carryout;

ALU_1_bit alu1
(
  .a(a),
  .b(b),
  .carryin(carryin),
  .ALUOp(ALUOp),
  .result(result),
  .carryout(carryout)
);

initial
begin
a = 1'b0;
b = 1'b0;
carryin = 1'b0;
ALUOp = 4'h0;
end

always
#5 a = ~a;
always
#10 b = ~b;
always
#20 carryin = ~carryin;

always
#40 ALUOp = (ALUOp + {1'b1});

endmodule