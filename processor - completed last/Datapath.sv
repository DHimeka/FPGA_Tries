module Datapath(
	 input logic clk, reset,
	 output logic[31:0] rdval,extmemdata, 
	 input logic[4:0] swval,
	 input logic[8:0] extmemaddress

	 

	 //input logic[31:0] pc1
    //output logic [31:0] result,
	 
);
logic [1:0] sel_sig;
logic [31:0]pc;
logic[31:0]Inst;
logic [31:0]reg1_val,reg2_val,result,resl,wd,result_Aftrl,A_bus,B_bus,B_inbus,C_bus,immOut,aluOut,aluOut1,decIn,dmemOut,pcIn,pcplusImm,valueplusImm;
logic [3:0] aluControl_signal;
logic [31:0] pcNext,pcIn1;
//logic regWrite,alucontrol,immSelMux,LoadMux,MemRead,MemWrite,pcBranch,Con_Jalr;
logic isZero, pcBranch1;
logic regWrite,immSelMux,LoadMux,MemRead,MemWrite,Con_Jalr,BranchSig,memcopy;
logic [2:0]LoadstoreSigodecoder;
logic[31:0] rdvalue;


adder_32 adder1(
	.a(pc),
	.b(32'b100),
	.y(pcNext)
);

adder_32 adder2(
	.a(pc),
	.b(immOut),
	.y(pcplusImm)
);

adder_32 adder3(
	.a(pc),
	.b(aluOut),
	.y(valueplusImm)
);

Mux2input muxrdsel(
	.a(C_bus),
	.b(pcNext),
	.select(Con_Jalr),
	.out(rdvalue)
);



Mux2input muxJALR(
	.a(pcIn1),
	.b(valueplusImm),
	.select(Con_Jalr),
	.out(pcIn)
);



Mux2input muxBranch(
	.a(pcNext),
	.b(pcplusImm),
	.select(pcBranch1),
	.out(pcIn1)
);

BranchSel bs(
	.zero(isZero),
	.branch(BranchSig),
	.rdlast_bit(aluOut[0]),
	.branch_type(sel_sig),
	.pcMux(pcBranch1)
);

//pc counter
pc pcreg(
	.clk(clk),
	.reset(reset),
	.pc_in(pcIn),
	.pc_out(pc)
);


//instruction mem
InstructionMemory Imem(
	.address(pc),
	.instruction(Inst)
);

//registers

RegFiles regF(
	.clk(clk),
	.rst(reset),
	.RegWrite(regWrite),
	.rg_wrt_dest(Inst[11:7]),
	.rs1(Inst[19:15]),
	.rs2(Inst[24:20]),
	.rg_wrt_data(rdvalue),
	.read_reg1(reg1_val),
	.read_reg2(reg2_val),
	.extaddress(swval),
	.rdval(rdval)

);
//sign_extender
imm_Gen immGen(
	.inst_code(Inst),
	.Imm_out(immOut)
);


Mux2input muxImmSel(
	.a(reg2_val),
	.b(immOut),
	.select(immSelMux),
	.out(B_inbus)
);

assign A_bus = reg1_val;



assign A_bus = reg1_val;


Microprogramming CU(
	.Opcode(Inst[6:0]),
	.Funct3(Inst[14:12]),
	.Funct7(Inst[31:25]),
	.regWrite(regWrite),
	.immSelMux(immSelMux),
	.LoadMux(LoadMux),
	.MemRead(MemRead),
	.MemWrite(MemWrite),
	.BranchSig(BranchSig),
	.Con_Jalr(Con_Jalr),
	.ALUSignal(aluControl_signal),
	.SelSignalforBranchSel(sel_sig),
	.LoadstoreSigodecoder(LoadstoreSigodecoder),
	.memcopy(memcopy)

	
);

Mux2input muxmemcopy(
	.a(B_inbus),
	.b(reg2_val),
	.select(memcopy),
	.out(B_bus)
);

ALUnitHW alu(
	.rs1(A_bus),
	.rs2(B_bus),
	.rd(aluOut),
	.rd1(aluOut1),
	.aluControl(aluControl_signal),
	.zero(isZero)
);


Mux2input muxLoadSel(
	.a(aluOut),
	.b(resl),
	.select(LoadMux),
	.out(result_Aftrl)
);

Mux2input muxwrite(
	.a(reg2_val),
	.b(dmemOut),
	.select(LoadMux),
	.out(decIn)
);

DeMux writemem(
	.a(result),
	.select(LoadMux),
	.out1(resl),
	.out2(wd)
);



Datamemory Dm(
	.clk(clk),
	.MemRead(MemRead),
	.MemWrite(MemWrite),
	.a(aluOut),
	.wd(wd),
	.rd(dmemOut),
	.rs1(aluOut),
	.rs2(aluOut1),
	.extmemdata(extmemdata),
	.extmemaddress(extmemaddress)

);

assign C_bus = result_Aftrl;

Decoder3by3 dc(
	.result(decIn),
	//.Inst(Inst),
	.out(result),
	.selection_input(LoadstoreSigodecoder)
);


endmodule




























