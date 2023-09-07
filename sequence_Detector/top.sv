module top(xx, yy, zz);	// Module definition start

	input xx, yy;	// Define inputs
	
	output zz;		// Define outputs
	
	wire aa_to_aa;	// Define a wire to connect 'aa's of the two instances.
	wire cc_to_bb;	// Define a wire to connect 'cc' and 'bb'.
	
	assign aa_to_aa = xx;	// Need to connect 'aa_to_aa' to 'xx' as well.
		
	// First instance of bottom module
	bottom bottom1(.aa(aa_to_aa),  // Connect 'aa' of the instance to 'aa_to_aa' wire
				   .bb(yy),		   // Connect 'bb' of the instance directly to 'yy'
				   .cc(cc_to_bb)); // Connect 'cc' of the instance to 'cc_to_bb' wire
						
	// Second instance of bottom module
	bottom bottom2(.aa(aa_to_aa),	// Connect 'aa' of the instance to 'aa_to_aa' wire
				   .bb(cc_to_bb),	// Connect 'bb' of the instance to 'cc_to_bb' wire
				   .cc(zz));		// Connect 'cc' of the instance to 'zz'
				
endmodule 			// Module definition end