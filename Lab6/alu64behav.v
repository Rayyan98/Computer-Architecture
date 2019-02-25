module ALU_64_behave
(
  input [63:0] a,b,
  input [3:0]Operation,
  output reg [63:0]Result,
  output reg Zero
);

always@(a,b,Operation)
begin
  if(Operation[1:0]==2'b00)
    begin
      Result = (Operation[3]?~a:a) & (Operation[2]?~b:b);
    end
  else if(Operation[1:0]==2'b01)
    begin
      Result = (Operation[3]?~a:a) | (Operation[2]?~b:b);
    end
  else if(Operation[1:0]==2'b10)
    begin
      Result = (Operation[3]?~a:a) + (Operation[2]?~b:b);
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