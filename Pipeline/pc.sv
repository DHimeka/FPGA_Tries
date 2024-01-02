module pc (
    input wire clk, reset, stall,
    input wire [31:0] pc_in,
    output reg [31:0] pc_out
);

always_ff @(posedge clk) begin
    if (!reset) begin
        pc_out <= 32'b0;
	 end
    else if (stall == 1'b0) begin
        pc_out <= pc_in;
	 end
end

endmodule
