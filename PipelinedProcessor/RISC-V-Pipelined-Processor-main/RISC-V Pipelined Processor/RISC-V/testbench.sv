module testbench;

  reg clk, reset;
  reg [63:0] element1, element2, element3, element4, element5, element6, element7, element8;
  reg stall, flush;

  // Add any other necessary inputs here

  wire [63:0] your_output_signals;  // Replace with the actual output signals

  RISC_V_Processor dut
  (
    .clk(clk),
    .reset(reset),
    .element1(element1),
    .element2(element2),
    .element3(element3),
    .element4(element4),
    .element5(element5),
    .element6(element6),
    .element7(element7),
    .element8(element8)

    // Add any other necessary connections here
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  initial 
    begin
      
      $dumpfile("dump.vcd");
      $dumpvars(1, testbench);
		
      clk = 1'b0;
      reset = 1'b1;
      
      #7 
      reset = 1'b0;
      #7000;
    end
endmodule
