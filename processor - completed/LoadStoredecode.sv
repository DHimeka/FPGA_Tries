module LoadStoredecode #(
	 parameter OPCODE_LENGTH = 7,
    parameter FUNCT3_LENGTH = 3,
    parameter FUNCT7_LENGTH = 7 

)(
	

	input logic [OPCODE_LENGTH-1:0] Opcode,
   input logic [FUNCT3_LENGTH-1:0] Funct3,
   input logic [FUNCT7_LENGTH-1:0] Funct7,
	
	
	output logic [2:0] Control_signal


);

always_comb begin
    Control_signal = 3'b000; // Default value

	 case (Opcode)
        7'b0000011 : begin
            case (Funct3)
                3'b000 : Control_signal = 3'b001;//[7:0] lb
					 3'b001 : Control_signal = 3'b010;// lh
					 3'b010 : Control_signal = 3'b011; //lw
					 3'b100 : Control_signal = 3'b100; //lbu[7:0]
					 3'b101 : Control_signal = 3'b101; //lhu[15:0]
					 
		
				endcase
			end
			7'b0100011 : begin
					case (Funct3)
                3'b000 : Control_signal = 3'b001;//[7:0] sb
					 3'b001 : Control_signal = 3'b010;// sh
					 3'b010 : Control_signal = 3'b011; //sw
					endcase
				end
				
		endcase

		
	end
	


endmodule