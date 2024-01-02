module ID_EX(
	input logic clk_i,
	input logic reset_i, //start_i,
	
	input logic [31:0] inst_i,
	input logic [4:0] rs1_i,
	input logic [4:0] rs2_i,
	input logic [4:0] rd_i,
	input logic [31:0] pcNext_i,
	input logic [31:0] pcr_i,
	input logic [31:0] pcplusImm_i,
	input logic [31:0] RDData1_i,
	input logic [31:0] RDData2_i,
	input logic [31:0] SignExtended_i,
	input logic [31:0] pc_i,
	input logic regWrite_i,immSelMux_i,LoadMux_i,MemRead_i,MemWrite_i,Con_Jalr_i,BranchSig_i,
	input logic [2:0] LoadstoreSigodecoder_i,
	input logic [3:0] aluControl_signal_i,
	input logic [1:0] sel_sig_i,
	
	
	output logic [31:0] inst_o,
	output logic [4:0] rs1_o,
	output logic [4:0] rs2_o,
	output logic [4:0] rd_o,
	
	output logic [31:0] pcNext_o,
	output logic [31:0] pcr_o,
	output logic [31:0] pcplusImm_o,
	output logic [31:0] pc_o,
	
	output logic [31:0] RDData1_o,
	output logic [31:0] RDData2_o,
	output logic [31:0] SignExtended_o,
	
	output logic regWrite_o,immSelMux_o,LoadMux_o,MemRead_o,MemWrite_o,Con_Jalr_o,BranchSig_o,
	output logic [2:0] LoadstoreSigodecoder_o,
	output logic [3:0] aluControl_signal_o,
	output logic [1:0] sel_sig_o
);



always@(posedge clk_i)begin//start_i) begin
	if(~reset_i) begin
		inst_o <= 0;
		rs1_o <= 0;
		rs2_o <= 0;
		rd_o <= 0;
		pcNext_o <= 0;
		pcr_o <= 0;
		pc_o<=0;
	   pcplusImm_o <= 0;
		RDData1_o <= 0;
		RDData2_o <= 0;
		SignExtended_o <= 0;
		regWrite_o <= 0;
		immSelMux_o <= 0;
		LoadMux_o <= 0;
		MemRead_o <= 0;
		MemWrite_o <= 0;
		Con_Jalr_o <= 0;
		BranchSig_o <= 0;
		LoadstoreSigodecoder_o <= 0;
		aluControl_signal_o <= 0;
		sel_sig_o <= 0;
		
		
	end
	else begin
		inst_o <= inst_i;
		rs1_o <= rs1_i;
		rs2_o <=rs2_i;
		rd_o <= rd_i;
		pcNext_o <=pcNext_i;
		pcr_o <= pcr_i;
	   pcplusImm_o <= pcplusImm_i;
		pc_o<=pc_i;
		RDData1_o <= RDData1_i;
		RDData2_o <= RDData2_i;
		SignExtended_o <= SignExtended_i;
		regWrite_o <= regWrite_i;
		immSelMux_o <= immSelMux_i;
		LoadMux_o <= LoadMux_i;
		MemRead_o <= MemRead_i;
		MemWrite_o <= MemWrite_i;
		Con_Jalr_o <= Con_Jalr_i;
		BranchSig_o <=  BranchSig_i;
		LoadstoreSigodecoder_o <= LoadstoreSigodecoder_i;
		aluControl_signal_o <= aluControl_signal_i;
		sel_sig_o <= sel_sig_i;
	end
end

endmodule