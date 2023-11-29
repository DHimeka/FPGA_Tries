module InstructionMemory #(parameter INS_ADDRESS=32,INS_W=32)(
    input logic [INS_ADDRESS - 1:0] address, // Read address of the instruction memory, comes from PC
    output logic [INS_W - 1:0] instruction
);

    logic [INS_W - 1:0] Inst_memory [70:0];
	 
    // Define the instruction memory as a simple array of 32-bit instructions.

    // Initialize memory with RISC-V instructions.
    //assign Inst_memory[0]=32'b0000000_00001_00000_000_00001_0010011; //addi r1 r0 1
    //assign Inst_memory[4]=32'b0000000_00001_00000_000_00010_0010011; //addi r2 r0 1
//    
//    
//    //R TYPE instruction
//    
//    assign Inst_memory[8]=32'b0000000_00010_00001_000_00011_0110011; //add r3 r1 r2
//    assign Inst_memory[12]=32'b0100000_00010_00001_000_00100_0110011; //sub r4 r1 r2
//    assign Inst_memory[16]=32'b0000000_00010_00001_001_00101_0110011; //sll r5 r1 r2
//    assign Inst_memory[20]=32'b0000000_00010_00001_010_00110_0110011; //slt r6 r1 r2
//    assign Inst_memory[22]=32'b0000000_00010_00001_011_00111_0110011; //sltu r7 r1 r2
//    assign Inst_memory[24]=32'b0000000_00010_00001_100_01000_0110011; //xor  r8 r1 r2
//    assign Inst_memory[28]=32'b0000000_00010_00001_101_01001_0110011; //srl  r9 r1 r2
//    assign Inst_memory[32]=32'b0100000_00010_00001_101_01010_0110011; //sra r10 r1 r2
//    assign Inst_memory[36]=32'b0000000_00010_00001_110_01011_0110011; //or r11 r1 r2
//    assign Inst_memory[40]=32'b0000000_00010_00001_111_01100_0110011; //and r12 r1 r2
//    
	
	
	//branch test
//	assign Inst_memory[8]=32'b0000000_00001_00010_000_00010_1100011;//beq rs1 rs2 (2)
//   assign Inst_memory[10]=32'b0000000_00001_00000_000_00101_0010011;//addi r5 r0 1
//   assign Inst_memory[14]=32'b0000000_00001_00000_000_00111_0010011;

	 //load test
//	 assign Inst_memory[0]=32'b0000000_00010_00000_000_00001_0010011;//addi r1 r0 2
//  assign Inst_memory[4]=32'b0000000_00001_00000_000_00010_0010011;//addi r2 r0 1
//	 assign Inst_memory[8]=32'b0000000_00011_00001_010_00011_0000011; //lw  r3 3(x1)
//	 
	 //store test
always_comb begin
	 Inst_memory[0]=32'b0000000_00010_00000_000_00001_0010011;//addi r1 r0 2
    Inst_memory[4]=32'b0000000_00001_00000_000_00010_0010011;//addi r2 r0 1
	
	 Inst_memory[8]=32'b0000000_00011_00000_000_00011_0010011; //addi r3 r0 3
    Inst_memory[12]=32'b0000000_00011_00000_000_00100_0010011; //addi r4 r0 3
	 Inst_memory[16]=32'b0000000_00010_00001_010_00011_0100011; //sw  r2 3(x1) store 1 in mem5
	 
	 Inst_memory[20]=32'b0000000_00011_00001_010_00101_0000011; //lw  r5 3(x1) load 1 from mem5
	 Inst_memory[24]=32'b0000000_00011_00100_000_00110_1100011;//beq r3 r4 (6)
	 
	 
	 Inst_memory[30]=32'b0000000_00010_00001_110_00110_0110011; //or r6 r1 r2 --should be 3
	 Inst_memory[34]=32'b0000000_00011_00100_000_00111_0000000; //add r7 r3 r4 --should be 6
	 Inst_memory[38]=32'b0000000_00001_00010_000_01000_0111111; //mul r8 r1 r2--should be 2
	 
	 Inst_memory[42]=32'b0000000_01110_00001_000_01001_1100111;// jalr --46 in reg9
	 Inst_memory[58]=32'b0000000_00011_00001_000_01010_0010011;//addi r10 r1 3 --should be 5
	 Inst_memory[62]=32'b0000000_01010_00001_010_11110_0100011;//sw r10 62(x1) --store 5 in mem64
	 
	 //jalr test
//	 assign Inst_memory[0]=32'b0000000_00010_00000_000_00001_0010011;//addi r1 r0 2
//    assign Inst_memory[4]=32'b0000000_00001_00000_000_00010_0010011;//addi r2 r0 1
//	 
//	 assign Inst_memory[8]=32'b0000000_01110_00001_000_00111_1100111;// jalr
//	 assign Inst_memory[24]=32'b0000000_00011_00000_000_00011_0010011;//addi r3 r0 3
//    
    // Read operation: Output the instruction at the provided address.
	 
	 
     instruction = Inst_memory[address];
end

endmodule
