`timescale 1ns / 1ps

module Datapath_tb();
	logic clk;
  logic reset;
  logic [4:0] swval;
  logic [8:0] extmemaddress;

  // Outputs
  logic [31:0] rdval, extmemdata;

	 
	 always #10 clk=~clk;
	 


     Datapath dut (
    .clk(clk),
    .reset(reset),
    .rdval(rdval),
    .extmemdata(extmemdata),
    .swval(swval),
    .extmemaddress(extmemaddress)
    // Add other module ports as needed
  );


    initial begin

		reset=0;
		#15;
		reset=1;
		#15;
	 end
	 
	 initial begin
    // Your test vectors go here

    // Example: Set input values
    swval = 5;
    extmemaddress = 13;

    // Wait for a few clock cycles
    #20;
	 swval = 9;
    extmemaddress = 14;

    // Wait for a few clock cycles
    #20;
	 
	 swval = 10;
    extmemaddress = 15;

    // Wait for a few clock cycles
    #20;

  end

endmodule

