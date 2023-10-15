module try(
    input logic clk, reset,
    input logic [4:0] sw,
    output logic [6:0] HEX4,
    output logic [6:0] HEX5
);

logic [31:0] rdvalue;
logic [4:0] swval;

Datapath dp (
    .clk(clk1),
    .reset(reset),
    .swval(swval),
    .rdvalue(rdvalue)
);

Clock_divider cd(
	.clock_in(clk),
	.clock_out(clk1)
);


hexdigit H2 ({sw[3:0]==swval[3:0]}?rdvalue[3:0]:4'b1111, HEX4);
hexdigit H3 ({sw[4]==swval[4]}?rdvalue[7:4]:4'b1111, HEX5);


endmodule
