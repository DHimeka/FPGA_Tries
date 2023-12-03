module Microprogramming #(
    parameter OPCODE_LENGTH = 7,
    parameter FUNCT3_LENGTH = 3,
    parameter FUNCT7_LENGTH = 7 

)(
	
	input logic [OPCODE_LENGTH-1:0] Opcode,
   input logic [FUNCT3_LENGTH-1:0] Funct3,
   input logic [FUNCT7_LENGTH-1:0] Funct7,


    output logic regWrite,
    output logic immSelMux,
    output logic LoadMux,
    output logic MemRead,
    output logic MemWrite,
    output logic Con_Jalr,
    output logic BranchSig,
    output logic [3:0]ALUSignal,
    output logic [1:0]SelSignalforBranchSel,
    output logic [2:0]LoadstoreSigodecoder,
	 output logic memcopy

);
logic [16:0]Control_signal;
logic[16:0] ROM[40:0];
logic [15:0]sig;

always_comb begin

	ROM[0] <= 17'b01000000000000000; //ADD
	ROM[1] <= 17'b01000000000100000; //SUB
	ROM[2] <= 17'b01000000001000000; //SLL
	ROM[3] <= 17'b01000000001100000; //SLT
	ROM[4] <= 17'b01000000010000000; //SLTU
	ROM[5] <= 17'b01000000010100000; //XOR
	ROM[6] <= 17'b01000000011000000; //SRL
	ROM[7] <= 17'b01000000011100000; //SRA
	ROM[8] <= 17'b01000000100000000; //OR
	ROM[9] <= 17'b01000000100100000; //AND


	ROM[10] <= 17'b01100000000000000; //ADDI
	ROM[11] <= 17'b01100000001100000; //SLTI
	ROM[12] <= 17'b01100000010000000; //SLTIU
	ROM[13] <= 17'b01100000010100000; //XORI
	ROM[14] <= 17'b01100000100000000; //ORI
	ROM[15] <= 17'b01100000100100000; //ANDI
	ROM[16] <= 17'b01100000001000000; //SLLI
	ROM[17] <= 17'b01100000011000000; //SRLI
	ROM[18] <= 17'b01100000011100000; //SRAI

	ROM[19] <= 17'b01100010000000000; //JALR

	ROM[20] <= 17'b01111000000000001; //LB
	ROM[21] <= 17'b01111000000000010; //LH
	ROM[22] <= 17'b01111000000000011; //LW
	ROM[23] <= 17'b01111000000000100; //LBU
	ROM[24] <= 17'b01111000000000101; //LHU

	ROM[25] <= 17'b00100100000000001; //SB
	ROM[26] <= 17'b00100100000000010; //SH
	ROM[27] <= 17'b00100100000000011; //SW

	ROM[28] <= 17'b000x0001000100000; //BEQ
	ROM[29] <= 17'b000x0001000101000; //BNQ
	ROM[30] <= 17'b000x0001001110000; //BLT
	ROM[31] <= 17'b000x0001001111000; //BGE
	ROM[32] <= 17'b000x0001010010000; //BLTU
	ROM[33] <= 17'b000x0001010011000; //BLGU

	ROM[34] <= 17'b00000000000000000;
	ROM[35] <= 17'b01000000101100000; //unsigned multiplication
	ROM[36] <= 17'b101x0000110000011; //memcopy

end


always_comb begin
	Control_signal = ROM[34]; // Default value
	//Selection_signal = 2'b00; // Default value
   
    case (Opcode)
        7'b0110011: begin
            case (Funct3)
                3'b000: begin
                    case (Funct7)
                        7'b0000000: Control_signal = ROM[0];  // ADD
                        7'b0100000: Control_signal = ROM[1]; // SUB
								default: Control_signal = ROM[34]; 
                    endcase
                end

                3'b001: Control_signal = ROM[2]; // SLL
                3'b010: Control_signal = ROM[3]; // SLT
                3'b011: Control_signal = ROM[4]; // SLTU
                3'b100: Control_signal = ROM[5]; // XOR

                3'b101: begin
                    case (Funct7)
                        7'b0000000: Control_signal = ROM[6]; // SRL
                        7'b0100000: Control_signal = ROM[7]; // SRA
								default: Control_signal = ROM[34]; 
                    endcase
                end

                3'b110: Control_signal = ROM[8]; // OR
                3'b111: Control_signal = ROM[9]; // AND
					 default: Control_signal = ROM[10]; 
            endcase
        end
		       7'b0010011: begin
                case(Funct3)
                    3'b000: Control_signal = ROM[10];//ADDI
                    3'b010: Control_signal = ROM[11];//SLTI
                    3'b011: Control_signal = ROM[12];//SLTIU
                    3'b100: Control_signal = ROM[13];//XORI
                    3'b110: Control_signal = ROM[14];//ORI
                    3'b111: Control_signal = ROM[15];//ANDI
                    3'b001: begin 
                        case(Funct7)
                            7'b0000000: Control_signal = ROM[16];//SLLI
									 default: Control_signal = ROM[34];
								endcase
							end
						 3'b101: begin
								case(Funct7)
                            7'b0100000: Control_signal = ROM[17];//SRLI
                            7'b0100000: Control_signal = ROM[18];//SRAI
                            default: Control_signal = ROM[34]; 
                        endcase
                    end

                    default: Control_signal = ROM[34];
                endcase
            end
				//7'b0000011 : Control_signal =ROM[22]; //For load and store functions
				//7'b0100011 : Control_signal =ROM[27];
				
				7'b1100011 : begin //for branch
					case(Funct3) 
						3'b000 : begin
									Control_signal = ROM[28]; //beq
									//Selection_signal = ROM[28];
									end
						3'b001 : begin
									Control_signal = ROM[29]; //bnq
									//Selection_signal = ROM[29];
									end
						3'b100 : begin
									Control_signal = ROM[30]; //blt
									//Selection_signal = ROM[30];
									end
						3'b101 : begin
									Control_signal = ROM[31]; //bge
									//Selection_signal = ROM[31];
									end
						3'b110 : begin
									Control_signal = ROM[32]; //bltu
									//Selection_signal = ROM[32];
									end
						3'b111 : begin
									Control_signal = ROM[33]; //blgu
									//Selection_signal =ROM[33];
									end
					   default: Control_signal = ROM[34]; 
					endcase
				end
				7'b1100111 : begin
							case(Funct3) 
								3'b000 : Control_signal = ROM[19];//JALR
							endcase
						end
				7'b0000011 : begin
            case (Funct3)
                3'b000 : Control_signal = ROM[20];//[7:0] lb
					 3'b001 : Control_signal = ROM[21];// lh
					 3'b010 : Control_signal = ROM[22]; //lw
					 3'b100 : Control_signal = ROM[23]; //lbu[7:0]
					 3'b101 : Control_signal = ROM[24]; //lhu[15:0]
					 
		
				endcase
			end
			7'b0100011 : begin
					case (Funct3)
                3'b000 : Control_signal = ROM[25];//[7:0] sb
					 3'b001 : Control_signal = ROM[26];// sh
					 3'b010 : Control_signal = ROM[27]; //sw
					endcase
				end
			7'b0111111 : Control_signal = ROM[35]; //unsigned multiplication
			7'b1111111 : Control_signal = ROM[36]; //memcopy
			endcase
		end


assign sig=Control_signal[15:0];
assign memcopy =Control_signal[16];
assign regWrite=Control_signal[15];
assign immSelMux=Control_signal[14];
assign LoadMux=Control_signal[13];
assign MemRead=Control_signal[12];
assign MemWrite = Control_signal[11];
assign Con_Jalr=Control_signal[10];
assign BranchSig = Control_signal[9];
assign ALUSignal = Control_signal[8:5];
assign SelSignalforBranchSel = Control_signal[4:3];
assign LoadstoreSigodecoder = Control_signal[2:0];








endmodule








