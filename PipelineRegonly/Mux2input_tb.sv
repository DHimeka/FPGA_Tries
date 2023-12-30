`timescale 1ns/1ps

module Mux2input_tb;

  // Signals
  reg [31:0] a;
  reg [31:0] b;
  reg select = 0;
  wire [31:0] out;

  // Instantiate the Mux2input module
  Mux2input dut (
    .a(a),
    .b(b),
    .select(select),
    .out(out)
  );

  // Test cases
  initial begin
    // Test 1: Select input "a" with select = 0
    a = 32'h12345678;
    b = 32'h87654321;
    select = 1'b0;
    #10;
    $display("Test 1: Select input 'a' with select = 0");
    $display("a: %h", a);
    $display("b: %h", b);
    $display("Select: %b", select);
    $display("Output (out): %h", out);

    // Test 2: Select input "b" with select = 1
    a = 32'h12345678;
    b = 32'h87654321;
    select = 1'b1;
    #10;
    $display("Test 2: Select input 'b' with select = 1");
    $display("a: %h", a);
    $display("b: %h", b);
    $display("Select: %b", select);
    $display("Output (out): %h", out);

    // Add more test cases...

    // Finish the simulation
    $finish;
  end

endmodule
