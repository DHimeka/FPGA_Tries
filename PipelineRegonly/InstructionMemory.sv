module InstructionMemory #(parameter INS_ADDRESS=32,INS_W=32)(
    input logic [INS_ADDRESS - 1:0] address, // Read address of the instruction memory, comes from PC
    output logic [INS_W - 1:0] instruction
);

    logic [INS_W - 1:0] Inst_memory [70:0];
	 
	 //assign Inst_memory[0]   = 32'h00007033;//      and  r0,r0,r0           ALUResult = h0 = r0          
    assign Inst_memory[0]   = 32'h00100093;//      addi r1,r0, 1           ALUResult = h1 = r1
    assign Inst_memory[4]   = 32'h00300113; //addi x2, x0, 3
    assign Inst_memory[8]   = 32'h00700193; //addi x3, x0, 7
    assign Inst_memory[12]   = 32'h00900213;//addi x4, x0, 9
    assign Inst_memory[16]   = 32'h00900293;//addi x5, x0, 9
    assign Inst_memory[20]   = 32'h001101b3;//add x3, x2, x1  4 in reg3
	 assign Inst_memory[24]   =32'h004121a3;  //sw x4, 3(x2) store 9 in mem 6
//	 assign Inst_memory[28]   = 32'h001101b3;//add x3, x2, x1  4 in reg3
//	 assign Inst_memory[32]   = 32'h001101b3;//add x3, x2, x1  4 in reg3
//	 assign Inst_memory[36]   = 32'h001101b3;//add x3, x2, x1  4 in reg3
	 assign Inst_memory[40]   = 32'h00312403;//lw x8 3(x2) load 9 to reg 8
	 

//	 assign Inst_memory[0] =32'b0000000_00010_00000_000_00001_0010011; //addi x1, x0, 2
//    assign Inst_memory[4] =32'b0000000_00001_00000_000_00010_0010011; //addi x2, x0, 1
//	
//	 assign Inst_memory[8] =32'b0000000_00011_00000_000_00011_0010011; //addi x3, x0, 3
//    assign Inst_memory[12]=32'b0000000_00011_00000_000_00100_0010011; //addi x4, x0, 3
//	 
//	 
//	 assign Inst_memory[16]=32'b0000000_00010_00001_010_00011_0100011; //sw   x2, 3(x1) store 1 in mem5
//	 
//	 assign Inst_memory[20]=32'b0000000_00011_00001_010_00101_0000011; //lw   x5, 3(x1) load 1 from mem5
//	 assign Inst_memory[24]=32'b0000000_00011_00100_000_00110_1100011; //beq  x3, x4, 6
//	 
//	 
//	 assign Inst_memory[30]=32'b0000000_00010_00001_110_00110_0110011; //or   x6, x1, x2  --should be 3
//	 assign Inst_memory[34]=32'b0000000_00011_00100_000_00111_0000000; //add  x7, x3, x4  --should be 6
//	 assign Inst_memory[38]=32'b0000000_00001_00010_000_01000_0111111; //mul  x8, x1, x2  --should be 2
//	 
//	 assign Inst_memory[42]=32'b0000000_01110_00001_000_01001_1100111; //jalr x9, 14(x1)  --46 in reg9
//	 assign Inst_memory[58]=32'b0000000_00011_00001_000_01010_0010011; //addi x10, x1, 3  --should be 5 
//	 assign Inst_memory[62]=32'b0000000_01010_00001_010_11110_0100011; //sw   x10, 62(x1) --store 5 in mem64
//	 assign Inst_memory[66]=32'b0000000_11111_00001_000_01011_0010011; //addi x11, x1, 31 --should be 33
//	 

	 
always_comb begin	 
    instruction = Inst_memory[address];
end

endmodule
