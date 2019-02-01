module Tb
(
	
);

	reg [63:0] aqua;
	reg [63:0] man;
	reg sel;
	wire [63:0] fer;

	Mux m1
	(
		.a(aqua),
		.b(man),
		.sel(sel),
		.data(fer)
	);

	initial 
	begin
  	aqua <= 64'b1000000000000000000000000000000000000000000000000000000000000000;
  	man <= 64'b0100000000000000000000000000000000000000000000000000000000000000;
  	sel <= 1'b0;

	#70 man[63] = 1'b1;
	#50 man[63] = 1'b0;
 	end

	always
	#50 sel = ~sel;

	initial 
	$monitor("Time = ", $time, "---> Output = %d", fer);

endmodule