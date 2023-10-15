`timescale 1ns/1ps

module Decoder3by3_tb;

  // Signals
  reg [31:0] result;
  reg [31:0] Inst;
  reg [2:0] selection_input;
  wire [31:0] out;

  // Instantiate the Decoder3by3 module
  Decoder3by3 dut (
    .result(result),
    .Inst(Inst),
    .selection_input(selection_input),
    .out(out)
  );

  // Test cases
  initial begin
    // Test 1: Selection input 001 (lb or sb)
    selection_input = 3'b001;
    result = 32'hABCDEF01; // Test result value
    #10;
    $display("Test 1: Selection input 001 (lb or sb)");
    $display("Result: %h", result);
    $display("Output: %h", out);

    // Test 2: Selection input 010 (lh or sh)
    selection_input = 3'b010;
    result = 32'h12345678; // Test result value
    #10;
    $display("Test 2: Selection input 010 (lh or sh)");
    $display("Result: %h", result);
    $display("Output: %h", out);

    // Test 3: Selection input 011 (lw or sw)
    selection_input = 3'b011;
    result = 32'hC0FFEE42; // Test result value
    #10;
    $display("Test 3: Selection input 011 (lw or sw)");
    $display("Result: %h", result);
    $display("Output: %h", out);

    // Add more test cases...

    // Finish the simulation
    $finish;
  end

endmodule
