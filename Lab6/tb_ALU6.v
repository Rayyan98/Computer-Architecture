module tb_ALU6
(
);

reg [5:0]a, b; 
reg carryin; 
reg [3:0]ALUOp;
wire carryout;
wire [5:0]result;

ALU6 alu0
(
.a(a),
.b(b),
.carryin(carryin),
.ALUOp(ALUOp),
.carryout(carryout),
.result(result)
);

initial 
begin
a = 6'b101010;
b <= 6'b110110;
ALUOp <= 4'h0;
carryin <= 1'b0;
end

always 
begin
#40 ALUOp <= {ALUOp + 1'b1};
end

endmodule