module clk_div (
	input clk_i,
	
	output clk_o
);

	reg [21 : 0] counter;
	
	always @(posedge clk_i) begin
		counter <= counter + 1;
	end
	
	assign clk_o = counter[21];

endmodule
