module Datapath_tb();

    logic clk=1'b0;
	 logic reset;
	 logic [31:0] rdvalue, extmemdata;
	 logic [4:0] swval;
	 logic [8:0] extmemaddress;

	 
	 always #10 clk=~clk;
	 


    Datapath dut (
        .clk(clk),
        .reset(reset),
		  .swval(swval),
		  .extmemdata(extmemdata),
		  .extmemaddress(extmemaddress),
		  .rdvalue(rdvalue)
    );


    initial begin

		reset=0;
		#15;
		reset=1;
	 end

endmodule
