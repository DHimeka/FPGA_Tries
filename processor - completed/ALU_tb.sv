module ALU_tb;

    // Parameters
    localparam DATA_WIDTH = 32;
    localparam OPCODE_LENGTH = 5;

    // Signals
    reg [DATA_WIDTH-1:0] rs1;
    reg [DATA_WIDTH-1:0] rs2;
    reg [OPCODE_LENGTH-1:0] Opcode;
    wire [DATA_WIDTH-1:0] rd;
    wire Con_BLT;
    wire Con_BGT;
    wire zero;

    // Instantiate the ALU module
    ALU #(DATA_WIDTH, OPCODE_LENGTH) uut (
        .rs1(rs1),
        .rs2(rs2),
        .Opcode(Opcode),
        .rd(rd),
        .Con_BLT(Con_BLT),
        .Con_BGT(Con_BGT),
        .zero(zero)
    );

    // Test vectors
    initial begin
        // Test case 1: ADD
        rs1 = 32'h00000001;
        rs2 = 32'h00000002;
        Opcode = 5'b00001;
        #10;
        // Check rd and other flags for ADD
        if (rd !== 32'h00000003 || Con_BLT !== 1'b0 || Con_BGT !== 1'b0 || zero !== 1'b0)
            $display("Test case 1 (ADD) failed");

        // Test case 2: SUB
        rs1 = 32'h00000003;
        rs2 = 32'h00000001;
        Opcode = 5'b00010;
        #10;
        // Check rd and other flags for SUB
        if (rd !== 32'h00000002 || Con_BLT !== 1'b0 || Con_BGT !== 1'b0 || zero !== 1'b0)
            $display("Test case 2 (SUB) failed");

        // Add more test cases for other instructions
        // Example test cases for some instructions:

        // Test case 3: SLL
        rs1 = 32'h00000001;
        rs2 = 32'h00000002; // Shift left by 2
        Opcode = 5'b00011;
        #10;
        // Check rd for SLL
        if (rd !== 32'h00000004)
            $display("Test case 3 (SLL) failed");

        // Test case 4: SLTU
        rs1 = 32'h00000001;
        rs2 = 32'h00000002;
        Opcode = 5'b00100;
        #10;
        // Check rd for SLTU
        if (rd !== 1'b1)
            $display("Test case 4 (SLTU) failed");

        // Add more test cases for other instructions here

        $finish;
    end

endmodule
