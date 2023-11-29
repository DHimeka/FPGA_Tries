module try(
    input logic clk, reset,
    input logic [4:0] sw,
	 input logic [8:0] swmem,
    output logic [6:0] HEX4,
    output logic [6:0] HEX5,
	 
	 output logic [6:0] HEX1,
    output logic [6:0] HEX2
	 

	 
);

logic [31:0] rdvalue, extmemdata;
logic [4:0] swval;
logic [8:0] extmemaddress;
logic [7:0] bcdrd;
logic [7:0] bcddata;

Datapath dp (
    .clk(clk1),
    .reset(reset),
    .swval(swval),
	 .extmemaddress(extmemaddress),
    .rdvalue(rdvalue),
	 .extmemdata(extmemdata)
);

Clock_divider cd(
	.clock_in(clk),
	.clock_out(clk1)
);

Binary_to_BCD uut (
    .bin(rdvalue),
    .bcd(bcdrd)
  );
Binary_to_BCD uut1 (
    .bin(extmemdata),
    .bcd(bcddata)
  );  


hexdigit H4 ({sw==swval}?bcdrd[3:0]:4'b1111, HEX4);
hexdigit H5 ({sw==swval}?bcdrd[7:4]:4'b1111, HEX5);

hexdigit H1 ({swmem==extmemaddress}?bcddata[3:0]:4'b1111, HEX1);
hexdigit H2 ({swmem==extmemaddress}?bcddata[7:4]:4'b1111, HEX2);



endmodule
