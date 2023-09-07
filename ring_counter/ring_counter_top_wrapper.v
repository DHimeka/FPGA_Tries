module ring_counter_top_wrapper (
	input sys_rst_i,
	input clk_i,
	
	output [7 : 0] counter_o

);

	wire clk_o;
	
	clk_div clk_div_inst (
		.clk_i(clk_i),
		.clk_o(clk_o)
	);
	
	ring_counter_top ring_counter_top_inst (
		.clk_i(clk_o),
		.sys_rst_i(sys_rst_i),
		.counter_o(counter_o)
	);
	

endmodule
