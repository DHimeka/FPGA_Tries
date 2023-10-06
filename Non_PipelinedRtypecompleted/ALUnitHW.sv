module ALUnitHW #(
    parameter DATA_WIDTH = 32,
    parameter OPCODE_LENGTH = 7,
    parameter FUNCT3_LENGTH = 3,
    parameter FUNCT7_LENGTH = 7 

)(
    input logic [DATA_WIDTH-1:0] rs1, 
    input logic [DATA_WIDTH-1:0] rs2,
    input logic [6:0] aluControl,
    
    output logic [DATA_WIDTH-1:0] rd,
    output logic Con_BLT,
    output logic Con_BGT,
    output logic zero
);

  
    always_comb begin
        rd = 'd0;
        Con_BLT = 'b0;
        Con_BGT = 'b0;
        zero = 'b0;
			
		case(aluControl)
			7'h1: rd = rs1+rs2; // ADD
			7'h2: rd = rs1-rs2; //SUB
			7'h3: rd = rs1<<(rs2[4:0] & 5'b11111); //SLL
			7'h4: rd = ($signed(rs1) < $signed(rs2)) ? 1'b1 : 1'b0; //SLT
			7'h5:	rd = (rs1 < rs2) ? 1'b1 : 1'b0; //SLTU
			7'h6: rd = rs1 ^ rs2; //XOR
			7'h7: rd = rs1 >> (rs2[4:0] & 5'b11111); //SRL 
			7'h8: rd = $signed(rs1) >>> (rs2[4:0] & 5'b11111); //SRA
			7'h9: rd = rs1 | rs2; //OR
			7'ha: rd = rs1 & rs2; //AND
			default: rd = 'b0;
        endcase
      end
		
endmodule
			

