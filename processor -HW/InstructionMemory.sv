module InstructionMemory #(parameter INS_ADDRESS=32,INS_W=32)(
    input logic [INS_ADDRESS - 1:0] address, // Read address of the instruction memory, comes from PC
    output logic [INS_W - 1:0] instruction
);

    logic [INS_W - 1:0] Inst_memory [31:0];
    // Define the instruction memory as a simple array of 32-bit instructions.

    // Initialize memory with RISC-V instructions.
        // Rtype test.
    //assign Inst_memory[0] = 32'b00000000000100011000000100110011;//add values in 1 and 2 reg and store to 3 

	 //assign Inst_memory[4] = 32'b00000000011100000000000101100011; //add 7 to value in 0 reg and write to reg1
    //assign Inst_memory[6] = 32'b00000000011100000000000000110011; 
	
	//branch test
//	 assign Inst_memory[0]=32'b0000000_00001_00000_000_00010_1100011;//beq rs1 rs2 (2)
//    assign Inst_memory[2]=32'b0000000_00001_00000_000_00101_0010011;//addi r5 r0 1
//    assign Inst_memory[6]=32'b0000000_00001_00000_000_00111_0010011;

	 //load test
//	 assign Inst_memory[0]=32'b0000000_00010_00000_000_00001_0010011;//addi r1 r0 2
//    assign Inst_memory[4]=32'b0000000_00001_00000_000_00010_0010011;//addi r2 r0 1
//	 assign Inst_memory[8]=32'b0000000_00011_00001_010_00011_0000011; //lw  r3 3(x1)
//	 
	 //store test
//	 assign Inst_memory[0]=32'b0000000_00010_00000_000_00001_0010011;//addi r1 r0 2
//  assign Inst_memory[4]=32'b0000000_00001_00000_000_00010_0010011;//addi r2 r0 1
//	 assign Inst_memory[8]=32'b0000000_00010_00001_010_00011_0100011; //sw  r2 3(x1) store 1 in mem5
	 
//	 assign Inst_memory[12]=32'b0000000_00011_00001_010_00011_0000011; //lw  r3 3(x1)
	 
	 //jalr test
	 assign Inst_memory[0]=32'b0000000_00010_00000_000_00001_0010011;//addi r1 r0 2
    assign Inst_memory[4]=32'b0000000_00001_00000_000_00010_0010011;//addi r2 r0 1
	 
	 assign Inst_memory[8]=32'b0000000_01110_00001_000_00111_1100111;// jalr
	 assign Inst_memory[24]=32'b0000000_00011_00000_000_00011_0010011;//addi r3 r0 3
    
    // Read operation: Output the instruction at the provided address.
    assign instruction = Inst_memory[address];

endmodule
