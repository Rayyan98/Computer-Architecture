module ALU_1_bit
(
        input a,b,carryin,[3:0]ALUOp,
        output reg result, carryout
);

wire mux1out;
wire mux2out;

assign mux1out = ALUOp[3]?~a:a;
assign mux2out = ALUOp[2]?~b:b;

always @ (*)
begin
assign result = ALUOp[1]?
                (~mux1out & ~mux2out & carryin | ~mux1out & mux2out & ~carryin | mux1out & ~mux2out & ~carryin |mux1out & mux2out & carryin):
                (ALUOp[0]?(mux1out | mux2out):(mux1out & mux2out));
assign carryout = ALUOp[1]?mux1out & mux2out | mux1out & carryin | carryin & mux2out:0;
end

endmodule