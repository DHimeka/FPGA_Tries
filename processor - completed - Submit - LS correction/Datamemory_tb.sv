`timescale 1ns/1ps

module Datamemory_tb;

  // Parameters
  localparam DM_ADDRESS = 9;
  localparam DATA_W = 32;

  // Signals
  reg clk = 0;
  reg MemRead = 0;
  reg MemWrite = 0;
  reg [DM_ADDRESS-1:0] a = 0;
  reg [DATA_W-1:0] wd = 0;
  wire [DATA_W-1:0] rd;

  // Instantiate the Data Memory
  Datamemory #(DM_ADDRESS, DATA_W) dut (
    .clk(clk),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .a(a),
    .wd(wd),
    .rd(rd)
  );
  
  logic [DATA_W-1:0] mem [(2**DM_ADDRESS)-1:0];
//	 
	 initial begin
		mem[5] =32'b00000000011100000000000010010011;
	 end

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Testbench stimulus
  initial begin
    // Read operation
    MemRead = 1;
    a = 5; // Address to read from
    #10;
    $display("Read Data (rd) at address 5: %h", rd);
    MemRead = 0;

    // Write operation
    MemWrite = 1;
    a = 3; // Address to write to
    wd = 32'h12345678; // Data to write
    #10;
    $display("Data written at address 3");
    MemWrite = 0;

    // Add more test cases here...

    // Finish the simulation
    $finish;
  end

endmodule
