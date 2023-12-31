module d_ff( // D Flipflop module name
	input clk_i, // clock signal
	input pr_i, // preset signal
	input clr_i, // clear signal
	input d_i, // data signal
	output reg q_o // output
);
always@(posedge clk_i or posedge pr_i or posedge clr_i)begin
	if(clr_i)
		q_o<=1'b0; // clear the output when "clr_i" is asserted
	else if(pr_i)
		q_o<=1'b1; // set the output when "pr_i" is asserted
	else begin
		q_o<=d_i; // latch the data at positive edge of the "clk_i"
	end
end

endmodule