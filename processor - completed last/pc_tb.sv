`timescale 1ns/1ps

module pc_tb;

  // Signals
  reg clk = 0;
  reg reset = 0;
  reg [31:0] pc_in;
  wire [31:0] pc_out;

  // Instantiate the pc module
  pc dut (
    .clk(clk),
    .reset(reset),
    .pc_in(pc_in),
    .pc_out(pc_out)
  );

  // Clock generation
  always begin
    #10 clk = ~clk;
  end

  // Test cases
  initial begin
    // Test 1: Initialize PC to 0
    reset = 1'b1;
	
    pc_in = 32'hAABBCCDD; // Initialize pc_in to a specific value
    #15 reset = 1'b0;
    #15 $display("Test 1: Initialize PC to 0");
    $display("Initial PC Input: %h", pc_in);
    $display("PC Output: %h", pc_out);

    // Test 2: Update PC with a new value
    pc_in = 32'h12345678; // Set a new value for pc_in
    #15 $display("Test 2: Update PC with a new value");
    $display("Updated PC Input: %h", pc_in);
    $display("PC Output: %h", pc_out);

    // Add more test cases...

    // Finish the simulation
    $finish;
  end

endmodule
