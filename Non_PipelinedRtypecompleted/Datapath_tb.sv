module Datapath_tb();

    // Define parameters
    //localparam CLK_PERIOD = 10;  // Clock period in simulation time units
    //localparam SIM_TIME   = 500; // Total simulation time

    // Declare signals for connecting the test bench to the Datapath module
    logic clk=1'b0;
	 logic reset;
    logic regWrite,isALUreg;
	 logic [31:0] pcNext;
    //logic [11:0] Imm;
    //logic [31:0] instr, memRdata;
    //logic [31:0] pc, aluOut, A_bus, B_bus;
    //logic [4:0] rs1, rs2, data_to_write;
    logic isZero, isBLT, isBGT;
	 logic [31:0]aluout;

	 

	 
	 always #10 clk=~clk;

	 
    // Instantiate the Datapath module
    Datapath dut (
        .clk(clk),
        .reset(reset),
        .regWrite(regWrite),
		  .alucontrol(isALUreg),
		  .pcNext(pcNext),
        .aluOut(aluout),
        .isZero(isZero),
        .isBLT(isBLT),
        .isBGT(isBGT)

    );

    // Clock generation
    

    // Test scenarios - You can add more test cases as needed
    initial begin
		//reset=0;
		//#15;
		reset=0;
		#100;
      pcNext=0;
		regWrite=1;
		isALUreg=1;
		//a = 32'b00000000000000000000000000001010;
		//b = 32'b00000000000000000000000000000010;

		
    end

endmodule
