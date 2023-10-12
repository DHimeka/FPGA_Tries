module ALUnitHW #(
    parameter DATA_WIDTH = 32

)(
    input logic [DATA_WIDTH-1:0] rs1, 
    input logic [DATA_WIDTH-1:0] rs2,
    input logic [3:0] aluControl,
    
    output logic [DATA_WIDTH-1:0] rd,
    output logic zero
);

  
    always_comb begin
        rd = 'd0;
        zero = 'b0;
			
		case(aluControl)
			4'h0: rd='b0;
		
		//R TYPE
			4'h1: rd = rs1+rs2; // ADD
			4'h2: 
					begin
					rd = rs1-rs2; //SUB
					zero =(rd==0)?1'b1:1'b0;
					end
			4'h3: rd = rs1<<(rs2[4:0] & 5'b11111); //SLL
			4'h4: rd = ($signed(rs1) < $signed(rs2)) ? 1'b1 : 1'b0; //SLT
			4'h5:	rd = (rs1 < rs2) ? 1'b1 : 1'b0; //SLTU
			4'h6: rd = rs1 ^ rs2; //XOR
			4'h7: rd = rs1 >> (rs2[4:0] & 5'b11111); //SRL 
			4'h8: rd = $signed(rs1) >>> (rs2[4:0] & 5'b11111); //SRA
			4'h9: rd = rs1 | rs2; //OR
			4'ha: rd = rs1 & rs2; //AND
			       
               
		
			default: rd = 'b0;
        endcase
      end
		
		
endmodule
			

