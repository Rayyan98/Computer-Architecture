module ALU_64
(
  input [63:0] a,b,
  input [3:0]Operation,
  output reg [63:0]Result,
  output reg Zero
);

always@(a,b,Operation)
begin
  if(Operation == 4'b0000)
    begin
      Result = a & b;
    end
  else if(Operation == 4'b0001)
    begin
      Result = a | b;
    end
  else if(Operation == 4'b0010)
    begin
      Result = a + b;
    end
  else if(Operation == 4'b0110)
    begin
      Result = a - b;
    end
  else if(Operation == 4'b1100)
    begin
      Result = a | b;
      Result = ~Result;
    end

  if(Result == 64'h0000_0000_0000_0000)
    begin
      Zero = 1;
    end
  else
    begin
      Zero = 0;
    end
end

endmodule