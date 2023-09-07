module sequence_detector(reset, clk, x, y);

	input reset, clk, x; // Define inputs
	
	output y; // Define outputs
		
	wire j1, k1, q1, j2, k2, q2;	// Define wires
	
	jk_ff ff1(						// First JK flip-flop to store state q1
			.reset(reset),
			.clk(clk),
			.j(j1),
			.k(k1),
			.q(q1));
	jk_ff ff2(						// First JK flip-flop to store state q2
			.reset(reset),
			.clk(clk),
			.j(j2),
			.k(k2),
			.q(q2));
	
				
	// Include the second JK flip-flop to store state q2
	// ********************************
	// ****** your code goes here *****
	// ********************************
							

	assign y = q1 & ~q2 & ~x;	// Boolean expression for y
	assign j1= x & q2;
	assign k1= (x^q2);
	assign j2= ~x;
	assign k2= x;
	
	// Write 'assign' statements (boolean expressions) for flip-flop inputs
	// ********************************
	// ****** your code goes here *****
	// ********************************
		
endmodule 