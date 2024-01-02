module Datapath(
	 input logic clk, reset,
	 output logic [31:0] extmemdata,rdval,
	 input logic[4:0] swval,
	 input logic[8:0] extmemaddress

	 

	 //input logic[31:0] pc1
    //output logic [31:0] result,
	 
);
logic[31:0] Inst2;
logic [1:0] sel_sig,sel_sig2;
logic [31:0]pc,pc_1,pc_2,pc_3,pc_4;
logic[31:0]Inst,Inst1;
logic [31:0]reg1_val,reg1_val2;
logic [31:0] reg2_val,reg2_val2,reg2_val3;
logic [31:0] result;
logic [31:0] resl,resl4;
logic [31:0] wd,result_Aftrl,A_bus,B_bus,C_bus;
logic [31:0] immOut,immOut2;
logic [31:0] aluOut,aluOut3,aluOut4,decIn,dmemOut;
logic [31:0] pcplusImm, pcplusImm2,pcplusImm3,pcplusImm4;
logic [31:0] valueplusImm,valueplusImm3,valueplusImm4;
logic [3:0] aluControl_signal,aluControl_signal1,aluControl_signal2;
logic [31:0] pcNext,pcNext1,pcNext2,pcNext3,pcNext4;
logic [31:0] mainIn,pcIn,pcIn1,pcIn2,pcIn3,pcIn4;
//logic regWrite,alucontrol,immSelMux,LoadMux,MemRead,MemWrite,pcBranch,Con_Jalr;
logic isZero,Hazard_o,flush; 
logic pcBranch2,pcBranch3,pcBranch4;
logic regWrite,regWrite1,regWrite2,regWrite3,regWrite4;
logic immSelMux,immSelMux1,immSelMux2;
logic LoadMux,LoadMux1,LoadMux2,LoadMux3,LoadMux4;
logic MemRead,MemRead1,MemRead2,MemRead3;
logic MemWrite,MemWrite1,MemWrite2,MemWrite3;
logic Con_Jalr,Con_Jalr1,Con_Jalr2,Con_Jalr3,Con_Jalr4;
logic BranchSig,BranchSig1,BranchSig2;
logic [2:0]LoadstoreSigodecoder,LoadstoreSigodecoder1,LoadstoreSigodecoder2,LoadstoreSigodecoder3,LoadstoreSigodecoder4;
logic[31:0] rdvalue;
logic [4:0] rd0,rd2,rd3,rd4;
logic [4:0] rs1fw, rs2fw;
logic [1:0] A_sel,B_sel;
logic [31:0] reg1_valfw,reg2_valfw;
//logic [31:0] pcplusImm1,pcplusImm2,pcplusImm3,pcplusImm4;

adder_32 adder1( // in the stage1
	.a(pc),
	.b(32'b100),
	.y(pcNext)
);

adder_32 adder2( // in the stage2
	.a(pc_1),
	.b(immOut),
	.y(pcplusImm)
);



Mux2input muxrdsel( 
	.a(C_bus),
	.b(pcNext1),
	.select(Con_Jalr),
	.out(rdvalue)
);



Mux2input muxJALR(
	.a(pcIn4),
	.b(valueplusImm4),
	.select(Con_Jalr4),
	.out(mainIn)
);



Mux2input muxBranch(
	.a(pcNext4),
	.b(pcplusImm4),
	.select(pcBranch4),
	.out(pcIn)
);

BranchSel bs(
	.zero(isZero),
	.branch(BranchSig2),
	.rdlast_bit(aluOut[0]),
	.branch_type(sel_sig2),
	.pcMux(pcBranch2)
);


pipeline_flush p_flush
(
   .branch(BranchSig),
   .flush(flush)
);

//pc counter
pc pcreg(
	.clk(clk),
	.reset(reset),
	.pc_in(mainIn),
	.stall(Hazard_o),
	.pc_out(pc)
);


//instruction mem
InstructionMemory Imem(
	.address(pc),
	.instruction(Inst)
);

HazardDetectUnit HazradDetect(
    .IF_IDrs1_i  (Inst1[24:20]),
    .IF_IDrs2_i  (Inst1[19:15]),
    .ID_EXrd_i  (rd2),
    .ID_EX_MemRead_i    (MemRead2),
    .Hazard_o   (Hazard_o)
);

MUX_Control MUX_Control(
    .Hazard_i   (Hazard_o), 
    .RegDst_i   (Inst1[11:7]),  
    .regWrite_i(regWrite),
    .immSelMux_i(immSelMux),
    .LoadMux_i(LoadMux),
    .MemRead_i(MemRead),
    .MemWrite_i(MemWrite),
    .Con_Jalr_i(Con_Jalr),
    .BranchSig_i(BranchSig),
    .ALUSignal_i(aluControl_signal),
    .SelSignalforBranchSel_i(sel_sig),
    .LoadstoreSigodecoder_i(LoadstoreSigodecoder),
	 .RegDst_o(rd0),
	 .regWrite_o(regWrite1),
    .immSelMux_o(immSelMux1),
    .LoadMux_o(LoadMux1),
    .MemRead_o(MemRead1),
    .MemWrite_o(MemWrite1),
    .Con_Jalr_o(Con_Jalr1),
    .BranchSig_o(BranchSig1),
    .ALUSignal_o(aluControl_signal1),
    .SelSignalforBranchSel_o(sel_sig1),
    .LoadstoreSigodecoder_o(LoadstoreSigodecoder1)
);

IF_ID PipReg1(
	.clk_i(clk),
	.reset_i(reset),
	.hazard_i(Hazard_o),
	.flush_i(flush),
	.pc_i(pc),
	.inst_i(Inst),
	.pcplus4_i(pcNext),
	.pcr_i(pcIn),
	.pcr_o(pcIn1),
	.pcplus4_o(pcNext1),
	.pc_o(pc_1),
	.inst_o(Inst1)
	

);


//registers

RegFiles regF(
	.clk(clk),
	.rst(reset),
	.RegWrite(regWrite),
	//.rg_wrt_dest(Inst1[11:7]),
	.rg_wrt_dest(rd4),
	.rs1(Inst1[19:15]),
	.rs2(Inst1[24:20]),
	.rg_wrt_data(rdvalue),
	.read_reg1(reg1_val),
	.read_reg2(reg2_val),
	.extaddress(swval),
	.rdval(rdval)

);
//sign_extender
imm_Gen immGen(
	.inst_code(Inst1),
	.Imm_out(immOut)
);

ID_EX pipReg2(
	.clk_i(clk),
	.reset_i(reset),
	.inst_i(Inst1),
	.rs1_i(Inst1[19:15]),
	.rs2_i(Inst1[24:20]),
	.rd_i(rd0),
	.pcNext_i(pcNext1),
	.pcr_i(pcIn1),
	.pcplusImm_i(pcplusImm),
	.RDData1_i(reg1_val),
	.RDData2_i(reg2_val),
	.SignExtended_i(immOut),
	.pc_i(pc_1),
	.regWrite_i(regWrite1),
	.immSelMux_i(immSelMux1),
	.LoadMux_i(LoadMux1),
	.MemRead_i(MemRead1),
	.MemWrite_i(MemWrite1),
	.Con_Jalr_i(Con_Jalr1),
	.BranchSig_i(BranchSig1),
	.LoadstoreSigodecoder_i(LoadstoreSigodecoder1),
	.aluControl_signal_i(aluControl_signal1),
	.sel_sig_i(sel_sig1),
	

	
	.inst_o(Inst2),
	.rs1_o(rs1fw),
	.rs2_o(rs2fw),
	.rd_o(rd2),
	.pcNext_o(pcNext2),
	.pcr_o(pcIn2),
	.pcplusImm_o(pcplusImm2),
	.RDData1_o(reg1_val2),
	.RDData2_o(reg2_val2),
	.pc_o(pc_2),
	.regWrite_o(regWrite2),
	.immSelMux_o(immSelMux2),
	.LoadMux_o(LoadMux2),
	.MemRead_o(MemRead2),
	.MemWrite_o(MemWrite2),
	.Con_Jalr_o(Con_Jalr2),
	.BranchSig_o(BranchSig2),
	.LoadstoreSigodecoder_o(LoadstoreSigodecoder2),
	.aluControl_signal_o(aluControl_signal2),
	.sel_sig_o(sel_sig2),
	.SignExtended_o(immOut2)

);


Mux2input muxImmSel(
	.a(reg2_valfw),
	.b(immOut2),
	.select(immSelMux2),
	.out(B_bus)
);

assign A_bus = reg1_valfw;


Microprogramming CU(
	.Opcode(Inst1[6:0]),
	.Funct3(Inst1[14:12]),
	.Funct7(Inst1[31:25]),
	.regWrite(regWrite),
	.immSelMux(immSelMux),
	.LoadMux(LoadMux),
	.MemRead(MemRead),
	.MemWrite(MemWrite),
	.BranchSig(BranchSig),
	.Con_Jalr(Con_Jalr),
	.ALUSignal(aluControl_signal),
	.SelSignalforBranchSel(sel_sig),
	.LoadstoreSigodecoder(LoadstoreSigodecoder)

	
);

Mux3input ForwardToData1(
    .select_i (A_sel),
    .data_i   (reg1_val2),
    .EX_MEM_i (aluOut3),
    .MEM_WB_i (result_Aftrl),
    .data_o   (reg1_valfw)
);

Mux3input ForwardToData2(
    .select_i (B_sel),
    .data_i   (reg2_val2),
    .EX_MEM_i (aluOut3),
    .MEM_WB_i (result_Aftrl),
    .data_o   (reg2_valfw)
);


ALUnitHW alu(
	.rs1(A_bus),
	.rs2(B_bus),
	.rd(aluOut),
	.aluControl(aluControl_signal2),
	.zero(isZero)
);

forwarding_unit FW(
	 .ID_EX_RS1(rs1fw),
	 .ID_EX_RS2(rs2fw),
	 .EX_MEM_rd(rd3),
	 .MEM_WB_rd(rd4),
    .EX_MEM_regWrite(regWrite3),
	 .MEM_WB_regWrite(regWrite4),
    .forward_A_select(A_sel),
	 .forward_B_select(B_sel)


);

EX_MEM pipReg3(
	.clk_i(clk),
	.reset_i(reset),
	//.pc_i(pc_2),
	.pcNext_i(pcNext2),
	.pcIn_i(pcIn2),
	.ALUResult_i(aluOut),
   .valueplusImm_i(valueplusImm),
	.pcplusImm_i(pcplusImm2),
	.RDData_i(reg2_val2),
	.rd_i(rd2),
	.Con_Jalr_i(Con_Jalr2),
	//.Branch_sig_i(BranchSig2),
	.pcBranch_i(pcBranch2),
	.RegWrite_i(regWrite2),
	.LoadMux_i(LoadMux2),
	.MemRead_i(MemRead2),
	.MemWrite_i(MemWrite2),
	.LoadstoreSigodecoder_i(LoadstoreSigodecoder2),
	//.pc_o(pc_3),
	.pcNext_o(pcNext3),
	.pcIn_o(pcIn3),
	.valueplusImm_o(valueplusImm3),
	.pcplusImm_o(pcplusImm3),
	.ALUResult_o(aluOut3),
	.RDData_o(reg2_val3),
	.rd_o(rd3),
	.Con_Jalr_o(Con_Jalr3),
	//.Branch_sig_o(BranchSig3),
	.pcBranch_o(pcBranch3),
	.RegWrite_o(regWrite3),
	.MemRead_o(MemRead3),
	.MemWrite_o(MemWrite3),
	.LoadstoreSigodecoder_o(LoadstoreSigodecoder3),
	.LoadMux_o(LoadMux3)

);

adder_32 adder3(  // in the stage3
	.a(pc_2),
	.b(aluOut),
	.y(valueplusImm)
);


Mux2input muxwrite( //in stage 4
	.a(reg2_val3),
	.b(dmemOut),
	.select(LoadMux3),
	.out(decIn)
);

DeMux writemem( //in stage 4
	.a(result),
	.select(LoadMux3),
	.out1(resl),
	.out2(wd)
);

Datamemory Dm(
	.clk(clk),
	.MemRead(MemRead3),
	.MemWrite(MemWrite3),
	.a(aluOut[8:0]),
	.wd(wd),
	.rd(dmemOut),
	.extmemdata(extmemdata),
	.extmemaddress(extmemaddress)

);

assign C_bus = result_Aftrl;

Decoder3by3 dc( // in stage 4
	.result(decIn),
	//.Inst(Inst),
	.out(result),
	.selection_input(LoadstoreSigodecoder3)
);

MEM_WB pipReg4(
	.clk_i(clk),
	.reset_i(reset),
	//.pc_i(pc_3),
	.pcNext_i(pcNext3),
	.pcIn_i(pcIn3),
	.valueplusImm_i(valueplusImm3),
	.pcplusImm_i(pcplusImm3),	
	.ALUResult_i(aluOut3),
	.memWrite_out2_i(resl),
	.rd_i(rd3),
	.pcBranch_i(pcBranch3),
	.RegWrite_i(regWrite3),
	.Con_Jalr_i(Con_Jalr3),
	.LoadMux_i(LoadMux3),
	//.pc_o(pc_4),
	.pcNext_o(pcNext4),
	.pcIn_o(pcIn4),
	.valueplusImm_o(valueplusImm4),
	.pcplusImm_o(pcplusImm4),
	.ALUResult_o(aluOut4),
	.memWrite_out2_o(resl4),
	.rd_o(rd4),
	.pcBranch_o(pcBranch4),
	.RegWrite_o(regWrite4),
	.Con_Jalr_o(Con_Jalr4),
	.LoadMux_o(LoadMux4)
	
);




Mux2input muxLoadSel( // in stage 5
	.a(aluOut4),
	.b(resl4),
	.select(LoadMux4),
	.out(result_Aftrl)
);

endmodule