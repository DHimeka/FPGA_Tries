`timescale 1ns/1ps

module ALU_tb;

  // Parameters
  localparam DATA_WIDTH = 32;

  // Signals
  reg [DATA_WIDTH-1:0] rs1;
  reg [DATA_WIDTH-1:0] rs2;
  reg [3:0] aluControl;
  wire [DATA_WIDTH-1:0] rd;
  wire zero;

  // Instantiate the ALU Unit
  ALUnitHW #(DATA_WIDTH) dut (
    .rs1(rs1),
    .rs2(rs2),
    .aluControl(aluControl),
    .rd(rd),
    .zero(zero)
  );

  // Clock generation
  reg clock = 0;
  always begin
    #5 clock = ~clock;
  end

  // Testbench stimulus
  initial begin
    // Initialize test vectors
    rs1 = 32'h5;
    rs2 = 32'h1;
    aluControl = 4'h0; // Test ADD operation

    // Apply test vectors
    #10 rs1 = 32'h1;
    rs2 = 32'h6;
    aluControl = 4'h1; // Test SUB operation

    // Add more test cases here...

    // Monitor the results
    #10 $display("Result (rd) = %h, Zero Flag = %b", rd, zero);

    // Finish the simulation
    $finish;
  end

  // Clock generation
  always #5 clock = ~clock;

endmodule
