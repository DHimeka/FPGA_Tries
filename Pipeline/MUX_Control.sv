module MUX_Control(
    input logic	Hazard_i, 
    input logic	[4:0]	RegDst_i,
    input logic regWrite_i,
    input logic immSelMux_i,
    input logic LoadMux_i,
    input logic MemRead_i,
    input logic MemWrite_i,
    input logic Con_Jalr_i,
    input logic BranchSig_i,
    input logic [3:0]ALUSignal_i,
    input logic [1:0]SelSignalforBranchSel_i,
    input logic [2:0]LoadstoreSigodecoder_i,
	 
	 output logic	[4:0]	RegDst_o,
	 output logic regWrite_o,
    output logic immSelMux_o,
    output logic LoadMux_o,
    output logic MemRead_o,
    output logic MemWrite_o,
    output logic Con_Jalr_o,
    output logic BranchSig_o,
    output logic [3:0]ALUSignal_o,
    output logic [1:0]SelSignalforBranchSel_o,
    output logic [2:0]LoadstoreSigodecoder_o


);


always_comb begin
    case(Hazard_i)
    1'b1 : begin
		RegDst_o <= 5'b00000;
		regWrite_o <= 1'b0;
		immSelMux_o <= 1'b0;
		LoadMux_o <= 1'b0;
		MemRead_o <= 1'b0;
		MemWrite_o <= 1'b0;
		Con_Jalr_o <= 1'b0;
		BranchSig_o <= 1'b0;
		ALUSignal_o <= 4'b0000;
		SelSignalforBranchSel_o <= 2'b00;
		LoadstoreSigodecoder_o <= 3'b00;
    end

    1'b0 : begin
		RegDst_o <= RegDst_i;
		regWrite_o <=regWrite_i;
		immSelMux_o <=immSelMux_i;
		LoadMux_o <=LoadMux_i;
		MemRead_o <=MemRead_i;
		MemWrite_o <=MemWrite_i;
		Con_Jalr_o <=Con_Jalr_i;
		BranchSig_o <=BranchSig_i;
		ALUSignal_o <=ALUSignal_i;
		SelSignalforBranchSel_o <=SelSignalforBranchSel_i;
		LoadstoreSigodecoder_o <=LoadstoreSigodecoder_i;
    end

    default : begin
		RegDst_o <= RegDst_i;
		regWrite_o <=regWrite_i;
		immSelMux_o <=immSelMux_i;
		LoadMux_o <=LoadMux_i;
		MemRead_o <=MemRead_i;
		MemWrite_o <=MemWrite_i;
		Con_Jalr_o <=Con_Jalr_i;
		BranchSig_o <=BranchSig_i;
		ALUSignal_o <=ALUSignal_i;
		SelSignalforBranchSel_o <=SelSignalforBranchSel_i;
		LoadstoreSigodecoder_o <=LoadstoreSigodecoder_i;
    end

    endcase

end
endmodule
