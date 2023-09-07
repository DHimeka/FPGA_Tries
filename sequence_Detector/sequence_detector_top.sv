module sequence_detector_top(reset_inv, clk, x, y, blink);

	localparam clk_dev_coef = 10;	// This is a constant which is resolved at compile
									// time. Since the frequency of the FPGA clock
									// (runs at 50 MHz) is too high to observe clearly, 
									// it is divided by 2^(clk_dev_coef+1).

	input reset_inv, clk;	// Define inputs. Note that pushbuttons are considered to 
							// be logic-high when not pressed. Hence, to use as the 
							// 'reset'signal for the rest of the modules, it should 
							// be inverted.
	
	output x, y, blink;		// Define outputs. 'blink' will be connected to a LED
							// which blinks in an observable frequency.
	
	wire clk_dev, reset;	// Define wires for divided clock and inverted reset 
							// pushbutton signals.
	
	reg[24:0] clk_div_reg;	// Register to divide the clock
	
		
	sequence_detector sd(					// Instance of sequence_detector
						.reset(reset),
						.clk(clk_dev),
						.x(x),
						.y(y));
	
	sequence_generator sg(					// Instance of sequence_generator
						.reset(reset),
						.clk(clk_dev),
						.seq(x));

	
	assign clk_dev = clk_div_reg[clk_dev_coef];	// Assign divided clock
	assign blink = clk_div_reg[24];				// Assign 'blink'
	assign reset = ~reset_inv;					// Invert reset pushbutton signal

	
	always@(posedge clk, posedge reset) begin	// Incrementing the clock-div register

		if (reset) clk_div_reg <= 0;

		else clk_div_reg <= clk_div_reg + 1;
			
	end


endmodule 