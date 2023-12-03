module try(
    input logic clk, reset,
    input logic [4:0] swval,
	 input logic [8:0] extmemaddress,
    output logic [6:0] HEX4,
    output logic [6:0] HEX5,
	 
	 output logic [6:0] HEX1,
    output logic [6:0] HEX2
	 

	 
);

logic [31:0] rdval, extmemdata;


logic [7:0] bcdrd;
logic [7:0] bcddata;

Datapath dp (
    .clk(clk1),
    .reset(reset),
    .swval(swval),
	 .extmemaddress(extmemaddress),
    .rdval(rdval),
	 .extmemdata(extmemdata)
);

Clock_divider cd(
	.clock_in(clk),
	.clock_out(clk1)
);

Binary_to_BCD uut (
    .bin(rdval),
    .bcd(bcdrd)
  );
Binary_to_BCD uut1 (
    .bin(extmemdata),
    .bcd(bcddata)
  );  


hexdigit H4 (bcdrd[3:0], HEX4);
hexdigit H5 (bcdrd[7:4], HEX5);

hexdigit H1 (bcddata[3:0], HEX1);
hexdigit H2 (bcddata[7:4], HEX2);



endmodule
