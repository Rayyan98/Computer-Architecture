module ALU_64_behave
(
  input [63:0] a,b,
  input [3:0]Operation,
  output reg [63:0]Result,
  output reg Zero
);

always@(a,b,Operation)
begin
  case(Operation)
	
	4'h0: Result <= a & b;
	4'h1: Result <= a | b;
	4'h2: Result <= a + b;
	4'h6: Result <= a - b;
	4'hC: Result <= ~(a | b);
	endcase
  if(Result == 64'b0)
	Zero <= 1'b1;
  else
	Zero <= 1'b0;

end

endmodule