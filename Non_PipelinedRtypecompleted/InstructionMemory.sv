module InstructionMemory #(parameter INS_ADDRESS=32,INS_W=32)(
    input logic [INS_ADDRESS - 1:0] address, // Read address of the instruction memory, comes from PC
    output logic [INS_W - 1:0] instruction
);

    logic [INS_W - 1:0] Inst_memory [4:0];
    // Define the instruction memory as a simple array of 32-bit instructions.

    // Initialize memory with RISC-V instructions.
        // Rtype test.
    assign Inst_memory[0] = 32'b01000000000100010000000110110011; //add values in 1 and 2 reg and store to 3 
    

    // Read operation: Output the instruction at the provided address.
    assign instruction = Inst_memory[address];

endmodule
