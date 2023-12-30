module EX_MEM(
	input logic clk_i,
	//start_i,
	input logic reset_i,
	//input logic [31:0] pc_i,
	input logic [31:0] pcNext_i,
	input logic [31:0] pcIn_i,
	input logic [31:0] pcplusImm_i,
	
	//zero_i,
	input logic [31:0] ALUResult_i,
   input logic [31:0] valueplusImm_i,
	input logic [31:0] RDData_i,
	input logic [4:0] rd_i,
	input logic Con_Jalr_i,pcBranch_i,RegWrite_i,LoadMux_i,MemRead_i,MemWrite_i,
	input logic [2:0] LoadstoreSigodecoder_i,
	//instr_i,
	//instr_o,
	
	//output logic [31:0] pc_o,
	output logic [31:0] pcNext_o,
	output logic [31:0] pcIn_o,
	output logic [31:0] pcplusImm_o,
	output logic [31:0] valueplusImm_o,
	output logic [31:0] ALUResult_o,
	//zero_o,
   
	output logic [31:0] RDData_o,
	output logic [4:0] rd_o,
	output logic Con_Jalr_o,pcBranch_o,RegWrite_o,MemRead_o,MemWrite_o,LoadMux_o,
	output logic [2:0] LoadstoreSigodecoder_o
);



always@(posedge clk_i) begin
	//if(~start_i) begin
	if (~reset_i) begin
		//pc_o <= 0;
		pcNext_o<=0;
		pcIn_o<=0;
		valueplusImm_o<=0;
		//zero_o <= 0;
		ALUResult_o <= 0;
		pcplusImm_o<=0;
        
		RDData_o <= 0;
		rd_o <= 0;
		Con_Jalr_o<=0;
		//Branch_sig_o<=0;
		pcBranch_o<=0;
		LoadMux_o<=0;
		RegWrite_o <= 0;
		MemRead_o <= 0;
		MemWrite_o <= 0;
		LoadstoreSigodecoder_o<=0;
		//instr_o	<= 0;
	end
	else begin
		//pc_o <= pc_i;
		pcNext_o<=pcNext_i;
		pcIn_o<=pcIn_i;
		valueplusImm_o<=valueplusImm_i;
		pcplusImm_o<=pcplusImm_i;
		//zero_o <= 0;
		ALUResult_o <= ALUResult_i;
        
		RDData_o <= RDData_i;
		rd_o <= rd_i;
		Con_Jalr_o<=Con_Jalr_i;
		//Branch_sig_o<=Branch_sig_i;
		pcBranch_o<=pcBranch_i;
		
		RegWrite_o <= RegWrite_i;
		MemRead_o <= MemRead_i;
		MemWrite_o <= MemWrite_i;
		LoadstoreSigodecoder_o<=LoadstoreSigodecoder_i;
		LoadMux_o<=LoadMux_i;
	end
end

endmodule