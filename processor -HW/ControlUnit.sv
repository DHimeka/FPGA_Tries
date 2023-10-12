module ControlUnit #(
    parameter OPCODE_LENGTH = 7,
    parameter FUNCT3_LENGTH = 3,
    parameter FUNCT7_LENGTH = 7 

)(
	
	input logic [OPCODE_LENGTH-1:0] Opcode,
   input logic [FUNCT3_LENGTH-1:0] Funct3,
   input logic [FUNCT7_LENGTH-1:0] Funct7,
	
	
	output logic [3:0] Control_signal,
	output logic [1:0] Selection_signal,
	output logic regWrite,immSelMux,LoadMux,MemRead,MemWrite,Con_Jalr,BranchSig


);

always_comb begin
    Control_signal = 4'h0; // Default value
	 Selection_signal = 2'b00; // Default value
    case (Opcode)
        7'b0110011: begin
            case (Funct3)
                3'b000: begin
                    case (Funct7)
                        7'b0000000: Control_signal = 4'h1;  // ADD
                        7'b0100000: Control_signal = 4'h2; // SUB
								default: Control_signal = 4'h0; 
                    endcase
                end

                3'b001: Control_signal = 4'h3; // SLL
                3'b010: Control_signal = 4'h4; // SLT
                3'b011: Control_signal = 4'h5; // SLTU
                3'b100: Control_signal = 4'h6; // XOR

                3'b101: begin
                    case (Funct7)
                        7'b0000000: Control_signal = 4'h7; // SRL
                        7'b0100000: Control_signal = 4'h8; // SRA
								default: Control_signal = 4'b0; 
                    endcase
                end

                3'b110: Control_signal = 4'h9; // OR
                3'b111: Control_signal = 4'ha; // AND
					 default: Control_signal = 4'h0; 
            endcase
        end
		       7'b0010011: begin
                case(Funct3)
                    3'b000: Control_signal = 4'h1;//ADDI
                    3'b010: Control_signal = 4'h4;//SLTI
                    3'b011: Control_signal = 4'h5;//SLTIU
                    3'b100: Control_signal = 4'h6;//XORI
                    3'b110: Control_signal = 4'h9;//ORI
                    3'b111: Control_signal = 4'ha;//ANDI
                    3'b001: begin 
                        case(Funct7)
                            7'b0000000: Control_signal = 4'h3;//SLLI
									 default: Control_signal = 4'h0;
								endcase
							end
						 3'b101: begin
								case(Funct7)
                            7'b0100000: Control_signal = 4'h7;//SRLI
                            7'b0100000: Control_signal = 4'h8;//SRAI
                            default: Control_signal = 4'h0; 
                        endcase
                    end

                    default: Control_signal = 4'h0;
                endcase
            end
				7'b0000011 : Control_signal =4'h1; //For load and store functions
				7'b0100011 : Control_signal =4'h1;
				
				7'b1100011 : begin //for branch
					case(Funct3) 
						3'b000 : begin
									Control_signal = 4'h2; //beq
									Selection_signal = 2'b00;
									end
						3'b001 : begin
									Control_signal = 4'h2; //bnq
									Selection_signal = 2'b01;
									end
						3'b100 : begin
									Control_signal = 4'h4; //blt
									Selection_signal = 2'b10;
									end
						3'b101 : begin
									Control_signal = 4'h4; //bge
									Selection_signal = 2'b11;
									end
						3'b110 : begin
									Control_signal = 4'h5; //bltu
									Selection_signal = 2'b10;
									end
						3'b111 : begin
									Control_signal = 4'h5; //blgu
									Selection_signal = 2'b11;
									end
					   default: Control_signal = 4'h0; 
					endcase
				end
				7'b1100111 : begin
							case(Funct3) 
								3'b000 : Control_signal = 4'h1;
							endcase
						end
				7'b0001111: // U-MUL
						Control_signal = 4'hb; // Define the control signal for unsigned multiplication
        
    endcase
 end

 
   always @*
begin
    case(Opcode)

        7'b0110011: //Rtype
            begin
                immSelMux = 'x;
                regWrite = 1;
					 LoadMux = 'x;
                MemRead = 0;
                MemWrite = 0;
					 Con_Jalr =0;
					 BranchSig =0;
            end

        7'b0000011: //Load
            begin
                immSelMux = 1;
                regWrite = 1;
					 LoadMux = 1;
                MemRead = 1;
                MemWrite = 0;  
					 Con_Jalr =0;
					 BranchSig =0;
            end

        7'b0100011: //store
            begin
                immSelMux = 1;
                regWrite = 0;
					 LoadMux = 'x;
                MemRead = 0;
                MemWrite =1;
					 Con_Jalr =0;
					 BranchSig =0;
            end

        7'b1100011: //branch
            begin
                immSelMux = 1;
                regWrite =0;
					 LoadMux = 'x;
                MemRead = 0;
                MemWrite = 0;
					 Con_Jalr =0;
					 BranchSig =1;
            end
				
		 7'b0010011: //Rtype I
				begin
                immSelMux = 1;
                regWrite = 1;
					 LoadMux = 0;
                MemRead = 0;
                MemWrite = 0;
					 Con_Jalr =0;
					 BranchSig =0;
            end
				
		7'b1100111: //JALR
				begin
                immSelMux = 1;
                regWrite = 1;
					 LoadMux = 0;
                MemRead = 0;
                MemWrite =0;
					 Con_Jalr =1;
					 BranchSig =0;
            end
      7'b0001111: // Default case
            begin
                immSelMux = 'x;
                regWrite = 0;
                LoadMux = 'x;
                MemRead = 0;
                MemWrite = 0;
                Con_Jalr = 0;
                BranchSig = 0;
            end
       
    endcase
end



endmodule