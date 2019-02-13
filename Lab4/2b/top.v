module top
(
	input clk, reset, rx,
	output tx, [3:0]q
);

	wire [7:0]w1;
	assign w1 = {4'b0000, q};
	ripple_carry_counter rcc0
	(
		.clk(clk),
		.reset(reset),
		.q(q)
	);
	
	uart_top ut0
	(
		.clk(clk),
		.reset(reset),
		.rx(rx),
		.tx(tx),
		.data_to_tx(w1)
	);
	


endmodule