module bottom(aa, bb, cc); // Module definition start

	input aa, bb;	// Define inputs

	output cc;	// Define outputs

	reg cc;		// Allocate a register to hold output value.

	always @(posedge aa) begin		// Triggered at the positive edge of 'aa'.
		
		cc <= bb & cc;		// Some logic goes here.
		
	end

endmodule 		//  Module definition end