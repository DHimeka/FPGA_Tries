module Datapath_tb();

    logic clk=1'b0;
	 logic reset;

	 
	 always #10 clk=~clk;
	 


    Datapath dut (
        .clk(clk),
        .reset(reset)   
    );


    initial begin

		reset=1;
		#15;
		reset=0;
	 end

endmodule
