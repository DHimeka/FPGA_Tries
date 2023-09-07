`timescale 10ns/1ns	// Timing information for the simulator.
					// 10ns - means #1 corresponds to 10 nano seconds.
					// 1ns - means the accuracy should be upto 1 nano second.

module tb_sequence_detector();	// Module definition start.
								// Just another ordinary module, but without
								// any inputs/outputs.

	reg reset, clk;	// Registers to hold the values for 'clk' and 'reset'
	
	wire x, y;		// Wires to connect inputs and outputs of the modules being tested.
	
	
	// Include an instance of sequence_generator
	// Note that wire 'x' should be connected to the 'seq' output of the generator
	// ********************************
	// ****** your code goes here *****
	// ********************************						
	sequence_detector sd(					// Instance of sequence_detector
						.reset(reset),
						.clk(clk),
						.x(x),
						.y(y));
	
	sequence_generator sg(					// Instance of sequence_generator
						.reset(reset),
						.clk(clk),
						.seq(x));

	// Include an instance of sequence_detector
	// ********************************
	// ****** your code goes here *****
	// ********************************
	
	
	initial begin		// Triggered at the very beginning. This is not synthesizeable.
		clk = 0;		// Initialize 'clk' to zero
		reset = 0;		// Initialize 'reset' to zero
		
		// All the modules need to be reset to start from a definite internal state. 
		// Hence, we need to generate a 'reset' posedge in the beginnig.
		#1 reset = 1;	// After 10ns, make 'reset' high
		#1 reset = 0;	// After another 10ns, make 'reset' low
 	end
	
	always #1 clk <= ~clk;	// Triggered at each 10ns period.
							// Each time, the state of 'clk' will be inverted, causing
							// it to act as a clock signal. Note that the
							// delay operator '#' is not synthesizable.

endmodule // Module definition end