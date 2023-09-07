module sequence_generator(reset, clk, seq); // Module definition start

	localparam init_seq = 4'b1000;	// Initial seed. 
									// Can be any 4-bit sequence except 4'b0000.
									// 'localparam' specifies that this is just a
									// constant which will be resolved at compile time.
	
	
	input reset, clk;	// Define inputs
	
	
	output seq;			// Define outputs
		
	
	reg[$size(init_seq)-1:0] seq_reg;	// Linear Feedback Shift Register (LFSR). Just
										// an ordinary register which can store many
										// bits :)
										
										// '$size()' is a Verilog system function which
										// will be resolved at compile time. It 
										// returns the length of its argument.
	
	
	assign seq = seq_reg[$size(init_seq)-1];	// Connect the output to the MSB
												// of the LFSR.
	
	
	always @(posedge clk, posedge reset) begin	// Triggered at each positive edge
												// of 'clk' or 'reset'
		
		if (reset) begin	// If 'reset' is high, reset LFSR to initial sequence.
			seq_reg <= init_seq;
		end
		
		else begin			// Else, generate the next sequence
			seq_reg <= {seq_reg[$size(init_seq)-2:0], seq_reg[$size(init_seq)-1] ^ seq_reg[$size(init_seq)-2]};
		end
	end
	
endmodule 