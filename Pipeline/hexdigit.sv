module hexdigit(
	input logic [3:0] in,
	output reg [6:0] out
);

always @*
begin
	out= 7'b1111111;
	
	case(in)
	
		4'h0: begin
		out = 7'b1000000;
		end
		
		4'h1:begin
		out = 7'b1111001;
		end
		
		4'h2: begin
		out = 7'b0100100;
		end
		
		4'h3: begin
		out = 7'b0110000;
		end
		
		4'h4: begin
		out = 7'b0011001;	
		end
		
		4'h5: begin
		out = 7'b0010010;
		
		end
		
		4'h6: begin
		out = 7'b0000010;
		end
		
		4'h7: begin
		out = 7'b1111000;
		end
		
		4'h8: begin
		out = 7'b0000000;
		end
		
		4'h9:begin
		out = 7'b0010000;
		end
		default: 
		out= 7'b1111111;
	endcase
end
endmodule	
		
		
		
		