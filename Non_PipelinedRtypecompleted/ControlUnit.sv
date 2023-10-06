module ControlUnit #(
    parameter OPCODE_LENGTH = 7,
    parameter FUNCT3_LENGTH = 3,
    parameter FUNCT7_LENGTH = 7 

)(
	input logic isALUreg,//include other signals here as well

	input logic [OPCODE_LENGTH-1:0] Opcode,
   input logic [FUNCT3_LENGTH-1:0] Funct3,
   input logic [FUNCT7_LENGTH-1:0] Funct7,
	
	
	output logic [6:0] Control_signal



);

always_comb begin
    Control_signal = 7'h0; // Default value

    case (Opcode)
        7'b0110011: begin
            case (Funct3)
                3'b000: begin
                    case (Funct7)
                        7'b0000000: Control_signal = 7'h1;  // ADD
                        7'b0100000: Control_signal = 7'h2; // SUB
                    endcase
                end

                3'b001: Control_signal = 7'h3; // SLL
                3'b010: Control_signal = 7'h4; // SLT
                3'b011: Control_signal = 7'h5; // SLTU
                3'b100: Control_signal = 7'h6; // XOR

                3'b101: begin
                    case (Funct7)
                        7'b0000000: Control_signal = 7'h7; // SRL
                        7'b0100000: Control_signal = 7'h8; // SRA
                    endcase
                end

                3'b110: Control_signal = 7'h9; // OR
                3'b111: Control_signal = 7'ha; // AND
            endcase
        end
    endcase


	end


endmodule