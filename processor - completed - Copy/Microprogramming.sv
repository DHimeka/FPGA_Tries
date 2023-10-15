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
    output logic [2:0]LoadstoreSigodecoder

);
logic [15:0]Control_signal;
logic[15:0] ROM[40:0];

always_comb begin

	ROM[0] <= 16'b1000000000000000; //ADD
	ROM[1] <= 16'b1000000000100000; //SUB
	ROM[2] <= 16'b1000000001000000; //SLL
	ROM[3] <= 16'b1000000001100000; //SLT
	ROM[4] <= 16'b1000000010000000; //SLTU
	ROM[5] <= 16'b1000000010100000; //XOR
	ROM[6] <= 16'b1000000011000000; //SRL
	ROM[7] <= 16'b1000000011100000; //SRA
	ROM[8] <= 16'b1000000100000000; //OR
	ROM[9] <= 16'b1000000100100000; //AND


	ROM[10] <= 16'b1100000000000000; //ADDI
	ROM[11] <= 16'b1100000001100000; //SLTI
	ROM[12] <= 16'b1100000010000000; //SLTIU
	ROM[13] <= 16'b1100000010100000; //XORI
	ROM[14] <= 16'b1100000100000000; //ORI
	ROM[15] <= 16'b1100000100100000; //ANDI
	ROM[16] <= 16'b1100000001000000; //SLLI
	ROM[17] <= 16'b1100000011000000; //SRLI
	ROM[18] <= 16'b1100000011100000; //SRAI

	ROM[19] <= 16'b1100010000000000; //JALR

	ROM[20] <= 16'b1111000000000001; //LB
	ROM[21] <= 16'b1111000000000010; //LH
	ROM[22] <= 16'b1111000000000011; //LW
	ROM[23] <= 16'b1111000000000100; //LBU
	ROM[24] <= 16'b1111000000000101; //LHU

	ROM[25] <= 16'b01x0100000000001; //SB
	ROM[26] <= 16'b01x0100000000010; //SH
	ROM[27] <= 16'b01x0100000000011; //SW

	ROM[28] <= 16'b00x0001000100000; //BEQ
	ROM[29] <= 16'b00x0001000101000; //BNQ
	ROM[30] <= 16'b00x0001001110000; //BLT
	ROM[31] <= 16'b00x0001001111000; //BGE
	ROM[32] <= 16'b00x0001010010000; //BLTU
	ROM[33] <= 16'b00x0001010011000; //BLGU

	ROM[34] <= 16'b0000000000000000;
	ROM[35] <= 16'b1000000101100000; //unsigned multiplication
	ROM[36] <= 16'b01x0000001111111; //memcopy

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








