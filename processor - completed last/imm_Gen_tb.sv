`timescale 1ns/1ps

module imm_Gen_tb;

  // Signals
  reg [31:0] inst_code;
  wire [31:0] Imm_out;

  // Instantiate the imm_Gen module
  imm_Gen dut (
    .inst_code(inst_code),
    .Imm_out(Imm_out)
  );

  // Test cases
  initial begin
    // Test 1: I-type load instruction (e.g., lb)
    inst_code = 32'b00000110011010000001000100000000;
    #10;
    $display("Test 1: I-type Load Immediate");
    $display("Input Instruction: %h", inst_code);
    $display("Generated Immediate: %h", Imm_out);

    // Test 2: I-type instruction with special handling (e.g., lui)
    inst_code = 32'b00101110011010000001000100000000;
    #10;
    $display("Test 2: I-type Immediate with Special Handling");
    $display("Input Instruction: %h", inst_code);
    $display("Generated Immediate: %h", Imm_out);

    // Add more test cases for different instruction types...

    // Finish the simulation
    $finish;
  end

endmodule
