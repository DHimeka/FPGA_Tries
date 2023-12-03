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
		  .rdval(rdvalue)
    );


    initial begin

		reset=0;
		#15;
		reset=1;
	 end
	 
	 initial begin
    // Set input values
    swval = 10;
    extmemaddress = 64;

    // Wait for a few clock cycles
    #20;

    // Check the output values
    $display("rdval = %d, extmemdata = %d", rdvalue, extmemdata);
	 
	 swval = 11;
    extmemaddress = 64;

    // Wait for a few clock cycles
    #20;

    // Check the output values
    $display("rdval = %d, extmemdata = %d", rdvalue, extmemdata);

    // Add more test scenarios as needed

  end


endmodule
