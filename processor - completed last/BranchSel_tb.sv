`timescale 1ns/1ps

module BranchSel_tb;

  // Signals
  reg zero = 0;
  reg branch = 0;
  reg rdlast_bit = 0;
  reg [1:0] branch_type = 2'b00;
  wire pcMux;

  // Instantiate the BranchSel module
  BranchSel dut (
    .zero(zero),
    .branch(branch),
    .rdlast_bit(rdlast_bit),
    .branch_type(branch_type),
    .pcMux(pcMux)
  );

  // Test cases
  initial begin
    // Test 1: Branch on equal (beq) with zero condition
    branch_type = 2'b00; // beq
    zero = 1'b1;
    branch = 1'b1;
    #10;
    $display("Test 1: Branch on equal (beq) with zero condition");
    $display("Branch: %b", branch);
    $display("Zero: %b", zero);
    $display("Result (pcMux): %b", pcMux);

    // Test 2: Branch on not equal (bnq) with non-zero condition
    branch_type = 2'b01; // bnq
    zero = 1'b0;
    branch = 1'b1;
    #10;
    $display("Test 2: Branch on not equal (bnq) with non-zero condition");
    $display("Branch: %b", branch);
    $display("Zero: %b", zero);
    $display("Result (pcMux): %b", pcMux);

    // Test 3: Branch on less than (blt) with rdlast_bit condition
    branch_type = 2'b10; // blt
    rdlast_bit = 1'b1;
    branch = 1'b1;
    #10;
    $display("Test 3: Branch on less than (blt) with rdlast_bit condition");
    $display("Branch: %b", branch);
    $display("rdlast_bit: %b", rdlast_bit);
    $display("Result (pcMux): %b", pcMux);

    // Test 4: Branch on greater than or equal (bge) with inverted rdlast_bit condition
    branch_type = 2'b11; // bge
    rdlast_bit = 1'b0;
    branch = 1'b1;
    #10;
    $display("Test 4: Branch on greater than or equal (bge) with inverted rdlast_bit condition");
    $display("Branch: %b", branch);
    $display("rdlast_bit: %b", rdlast_bit);
    $display("Result (pcMux): %b", pcMux);

    // Finish the simulation
    $finish;
  end

endmodule
