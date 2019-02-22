module ALU6
(
input [5:0]a, b,
input carryin,
input [3:0]ALUOp,
output carryout,
output [5:0]result
);

wire temp1, temp2, temp3, temp4, temp5;

ALU_1_bit alu1
(
  .a(a[0]),
  .b(b[0]),
  .carryin(carryin),
  .ALUOp(ALUOp),
  .carryout(temp1),
  .result(result[0])
);

ALU_1_bit alu2
(
  .a(a[1]),
  .b(b[1]),
  .carryin(temp1),
  .ALUOp(ALUOp),
  .carryout(temp2),
  .result(result[1])
);

ALU_1_bit alu3
(
  .a(a[2]),
  .b(b[2]),
  .carryin(temp2),
  .ALUOp(ALUOp),
  .carryout(temp3),
  .result(result[2])
);

ALU_1_bit alu4
(
  .a(a[3]),
  .b(b[3]),
  .carryin(temp3),
  .ALUOp(ALUOp),
  .carryout(temp4),
  .result(result[3])
);

ALU_1_bit alu5
(
  .a(a[4]),
  .b(b[4]),
  .carryin(temp4),
  .ALUOp(ALUOp),
  .carryout(temp5),
  .result(result[4])
);

ALU_1_bit alu6
(
  .a(a[5]),
  .b(b[5]),
  .carryin(temp5),
  .ALUOp(ALUOp),
  .carryout(carryout),
  .result(result[5])
);

endmodule