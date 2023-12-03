module testbench;

  reg [31:0] bin;
  wire [7:0] bcd;

  // instantiate the module
  Binary_to_BCD uut (
    .bin(bin),
    .bcd(bcd)
  );

  // stimulus
  initial begin
    // Test case 1: bin = 99
    bin = 32'b11111; // 99 in hexadecimal
    #10; // wait for 10 time units
    $display("Input: %d, Output BCD: %b", bin, bcd);

    // Test case 2: bin = 46
    bin = 32'h0000002E; // 46 in hexadecimal
    #10; // wait for 10 time units
    $display("Input: %d, Output BCD: %d", bin, bcd);

    // Test case 3: bin = 53
    bin = 32'h00000035; // 53 in hexadecimal
    #10; // wait for 10 time units
    $display("Input: %d, Output BCD: %d", bin, bcd);

    $finish; // terminate simulation
  end

endmodule
