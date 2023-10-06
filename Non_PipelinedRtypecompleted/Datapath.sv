module Datapath(
	 input logic clk, reset,
    input logic regWrite,alucontrol,
	 input logic[31:0] pcNext,
    output logic [31:0] aluOut,
	 output logic isZero, isBLT,isBGT
);

logic [31:0]pc;
logic[31:0]Inst;
logic [31:0]reg1_val,reg2_val,wrt_data,A_bus,B_bus;
logic [6:0] aluControl_signal;


//pc counter
pc pcreg(
	.clk(clk),
	.reset(reset),
	.pc_in(pcNext),
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
	.rst(rst),
	.RegWrite(regWrite),
	.rg_wrt_dest(Inst[11:7]),
	.rs1(Inst[19:15]),
	.rs2(Inst[24:20]),
	.rg_wrt_data(wrt_data),
	.read_reg1(reg1_val),
	.read_reg2(reg2_val)

);

assign A_bus = reg1_val;
assign B_bus = reg2_val;

ControlUnit CU(
	.isALUreg(alucontrol),
	.Opcode(Inst[6:0]),
	.Funct3(Inst[14:12]),
	.Funct7(Inst[31:25]),
	.Control_signal(aluControl_signal)

);


ALUnitHW alu(
	.rs1(A_bus),
	.rs2(B_bus),
	.rd(aluOut),
	.aluControl(aluControl_signal),
	.Con_BLT(isBLT),
	.Con_BGT(isBGT),
	.zero(isZero)
);


endmodule