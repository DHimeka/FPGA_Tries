module Datapath_tb();

    logic clk=1'b0;
	 logic reset;
	 logic [31:0] rdvalue;
	 logic swval;

	 
	 always #10 clk=~clk;
	 


    Datapath dut (
        .clk(clk),
        .reset(reset),
		  .swval(swval),
		  .rdvalue(rdvalue)
    );


    initial begin

		reset=1;
		#15;
		reset=0;
	 end

endmodule
