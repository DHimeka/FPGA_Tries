module ALUnitHW_Tb();

    // Parameters
    localparam DATA_WIDTH = 32;
    localparam OPCODE_LENGTH = 7;
    localparam FUNCT3_LENGTH = 3;
    localparam FUNCT7_LENGTH = 7;

    // Inputs
    reg [DATA_WIDTH-1:0] rs1;
    reg [DATA_WIDTH-1:0] rs2;
    reg [OPCODE_LENGTH-1:0] Opcode;
    reg [FUNCT3_LENGTH-1:0] Funct3;
    reg [FUNCT7_LENGTH-1:0] Funct7;
	 reg [DATA_WIDTH-1:20] immI;
	 reg [DATA_WIDTH-1:12] immU;

    // Outputs
    wire [DATA_WIDTH-1:0] rd;
    wire Con_BLT;
    wire Con_BGT;
    wire zero;

    // Instantiate the module under test
    ALUnitHW #(DATA_WIDTH, OPCODE_LENGTH, FUNCT3_LENGTH, FUNCT7_LENGTH)
        dut (
            .rs1(rs1),
            .rs2(rs2),
            .Opcode(Opcode),
            .Funct3(Funct3),
            .Funct7(Funct7),
				.immI(immI),
				.immU(immU),
            .rd(rd),
            .Con_BLT(Con_BLT),
            .Con_BGT(Con_BGT),
            .zero(zero)
        );

    // Clock generation (assuming a 50 MHz clock)
    reg clock = 0;
    always begin
        #5 clock = ~clock;
    end

    // Test cases
    initial begin
        // Test case 1: ADD instruction
        rs1 = 5;
        rs2 = 10;
        Opcode = 7'b0110011; // ADD instruction
        Funct3 = 3'b000;    // Funct3 for ADD
        Funct7 = 7'b0000000; // Funct7 for ADD
		  
        #10; // Allow some time for the computation
        $display("Test case 1: ADD result = %d", rd);
        if (rd === 15) // Expected result
            $display("Test case 1 passed");
        else
            $display("Test case 1 failed");
				
	    // Test case 2: SUB instruction
        rs1 = 15;
        rs2 = 5;
        Opcode = 7'b0110011; // SUB instruction
        Funct3 = 3'b000;    // Funct3 for SUB
        Funct7 = 7'b0100000; // Funct7 for SUB
        #10; // Allow some time for the computation
        $display("Test case 2: SUB result = %d", rd);
        if (rd === 10) // Expected result
            $display("Test case 2 passed");
        else
            $display("Test case 2 failed");

        // Test case 3: SLL instruction
        rs1 = 8;
        rs2 = 2;
        Opcode = 7'b0110011; // SLL instruction
        Funct3 = 3'b001;     // Funct3 for SLL
        Funct7 = 7'b0000000; // Funct7 is not used for SLL
        #10; // Allow some time for the computation
        $display("Test case 3: SLL result = %d", rd);
        if (rd === 32) // Expected result
            $display("Test case 3 passed");
        else
            $display("Test case 3 failed");

        // Test case 4: SLT instruction
        rs1 = 5;
        rs2 = 10;
        Opcode = 7'b0110011; // SLT instruction
        Funct3 = 3'b010;     // Funct3 for SLT
        Funct7 = 7'b0000000; // Funct7 is not used for SLT
        #10; // Allow some time for the computation
        $display("Test case 4: SLT result = %d", rd);
        if (($signed(rs1)<$signed(rs2)) && rd === 1) // Expected result
            $display("Test case 4 passed");
        else if (($signed(rs1)>$signed(rs2)) && rd === 0)
            $display("Test case 4 passed");
		  else
				$display("Test case 4 failed");

        // Test case 5: SLTU instruction
        rs1 = 32'hFFFFFFFF; // Maximum unsigned value
        rs2 = 32'h00000001; // Minimum unsigned value
        Opcode = 7'b0110011; // SLTU instruction
        Funct3 = 3'b011;     // Funct3 for SLTU
        Funct7 = 7'b0000000; // Funct7 is not used for SLTU
        #10; // Allow some time for the computation
        $display("Test case 5: SLTU result = %d", rd);
        if ((rs1<rs2) && rd === 1) // Expected result
            $display("Test case 5 passed");
        else if ((rs1>rs2)&& rd === 0)
            $display("Test case 5 passed");
		  else
				$display("Test case 5 failed");


        // Test case 6: XOR instruction
        rs1 = 15;
        rs2 = 10;
        Opcode = 7'b0110011; // XOR instruction
        Funct3 = 3'b100;     // Funct3 for XOR
        Funct7 = 7'b0000000; // Funct7 is not used for XOR
        #10; // Allow some time for the computation
        $display("Test case 6: XOR result = %d", rd);
        if (rd === 5) // Expected result
            $display("Test case 6 passed");
        else
            $display("Test case 6 failed");

        // Test case 7: SRL instruction
        rs1 = 32'h80000000; // Shift out the sign bit
        rs2 = 2;
        Opcode = 7'b0110011; // SRL instruction
        Funct3 = 3'b101;     // Funct3 for SRL
        Funct7 = 7'b0000000; // Funct7 is not used for SRL
        #10; // Allow some time for the computation
        $display("Test case 7: SRL result = %d", rd);
        if (rd === 536870912) // Expected result
            $display("Test case 7 passed");
        else
            $display("Test case 7 failed");

        // Test case 8: SRA instruction
        rs1 = 32'h80000000; // Shift out the sign bit
        rs2 = 2;
        Opcode = 7'b0110011; // SRA instruction
        Funct3 = 3'b101;     // Funct3 for SRA
        Funct7 = 7'b0100000; // Funct7 for SRA
        #10; // Allow some time for the computation
        $display("Test case 8: SRA result = %d", rd);
        if (rd === -536870912) // Expected result
            $display("Test case 8 passed");
        else
            $display("Test case 8 failed");

        // Test case 9: OR instruction
        rs1 = 15;
        rs2 = 10;
        Opcode = 7'b0110011; // OR instruction
        Funct3 = 3'b110;     // Funct3 for OR
        Funct7 = 7'b0000000; // Funct7 is not used for OR
        #10; // Allow some time for the computation
        $display("Test case 9: OR result = %d", rd);
        if (rd === 15) // Expected result
            $display("Test case 9 passed");
        else
            $display("Test case 9 failed");

        // Test case 10: AND instruction
        rs1 = 15;
        rs2 = 10;
        Opcode = 7'b0110011; // AND instruction
        Funct3 = 3'b111;     // Funct3 for AND
        Funct7 = 7'b0000000; // Funct7 is not used for AND
        #10; // Allow some time for the computation
        $display("Test case 10: AND result = %d", rd);
        if (rd === 10) // Expected result
            $display("Test case 10 passed");
        else
            $display("Test case 10 failed");

        // Test case 11: ADDI instruction
        rs1 = 20;
        immI = 5;
        Opcode = 7'b0010011; // ADDI instruction
        Funct3 = 3'b000;     // Funct3 for ADDI
        Funct7 = 7'b0000001;          // Funct7 is not used for ADDI
        #20; // Allow some time for the computation
        $display("Test case 11: ADDI result = %d", rd);
        if (rd === 57) // Expected result
            $display("Test case 11 passed");
        else
            $display("Test case 11 failed");

        // Test case 12: SLLI instruction
			rs1 = 8;
			immI = 2;
			Opcode = 7'b0010011; // SLLI instruction
			Funct3 = 3'b001;     // Funct3 for SLLI
			Funct7 = 7'b0000000; // Funct7 is not used for SLLI
			#20; // Allow some time for the computation
			$display("Test case 12: SLLI result = %d", rd);
			if (rd === 32) // Expected result
				 $display("Test case 12 passed");
			else
				 $display("Test case 12 failed");

			// Test case 13: SRLI instruction
			rs1 = 128; // Shift out the sign bit
			immI = 2;
			Opcode = 7'b0010011; // SRLI instruction
			Funct3 = 3'b101;     // Funct3 for SRLI
			Funct7 = 7'b0000000; // Funct7 is not used for SRLI
			#20; // Allow some time for the computation
			$display("Test case 13: SRLI result = %d", rd);
			if (rd === 32) // Expected result
				 $display("Test case 13 passed");
			else
				 $display("Test case 13 failed");

			// Test case 14: SRAI instruction
			rs1 = 128; // Shift out the sign bit
			immI = 2;
			Opcode = 7'b0010011; // SRAI instruction
			Funct3 = 3'b101;     // Funct3 for SRAI
			Funct7 = 7'b0100000; // Funct7 for SRAI
			#20; // Allow some time for the computation
			$display("Test case 14: SRAI result = %d", rd);
			if (rd === -32) // Expected result
				 $display("Test case 14 passed");
			else
				 $display("Test case 14 failed");

			// Test case 15: ANDI instruction
			rs1 = 15;
			immI = 10;
			Opcode = 7'b0010011; // ANDI instruction
			Funct3 = 3'b111;     // Funct3 for ANDI
			Funct7 = 7'b0000000; // Funct7 is not used for ANDI
			#10; // Allow some time for the computation
			$display("Test case 15: ANDI result = %d", rd);
			if (rd === 10) // Expected result
				 $display("Test case 15 passed");
			else
				 $display("Test case 15 failed");

			// Test case 16: ORI instruction
			rs1 = 15;
			immI = 10;
			Opcode = 7'b0010011; // ORI instruction
			Funct3 = 3'b110;     // Funct3 for ORI
			Funct7 = 7'b0000000; // Funct7 is not used for ORI
			#10; // Allow some time for the computation
			$display("Test case 16: ORI result = %d", rd);
			if (rd === 15) // Expected result
				 $display("Test case 16 passed");
			else
				 $display("Test case 16 failed");

			// Test case 17: XORI instruction
			rs1 = 15;
			immI = 10;
			Opcode = 7'b0010011; // XORI instruction
			Funct3 = 3'b100;     // Funct3 for XORI
			Funct7 = 7'b0000000; // Funct7 is not used for XORI
			#20; // Allow some time for the computation
			$display("Test case 17: XORI result = %d", rd);
			if (rd === 5) // Expected result
				 $display("Test case 17 passed");
			else
				 $display("Test case 17 failed");

			// Test case 18: SLTI instruction
			rs1 = 5;
			immI = 10;
			Opcode = 7'b0010011; // SLTI instruction
			Funct3 = 3'b010;     // Funct3 for SLTI
			Funct7 = 7'b0000000; // Funct7 is not used for SLTI
			#20; // Allow some time for the computation
			$display("Test case 18: SLTI result = %d", rd);
			if (($signed(rs1) < $signed(rs2)) && rd === 1) // Expected result
				 $display("Test case 18 passed");
			else if (($signed(rs1) > $signed(rs2)) && rd === 0)
				 $display("Test case 18 passed");
			else
				 $display("Test case 18 failed");

			// Test case 19: SLTIU instruction
			rs1 = 32'hFFFFFFFF; // Maximum unsigned value
			immI = 32'h00000001; // Minimum unsigned value
			Opcode = 7'b0010011; // SLTIU instruction
			Funct3 = 3'b011;     // Funct3 for SLTIU
			Funct7 = 7'b0000000; // Funct7 is not used for SLTIU
			#20; // Allow some time for the computation
			$display("Test case 19: SLTIU result = %d", rd);
			if ((rs1 < rs2) && rd === 1) // Expected result
				 $display("Test case 19 passed");
			else if ((rs1 > rs2) && rd === 0)
				 $display("Test case 19 passed");
			else
				 $display("Test case 19 failed");

			// Test case 20: LUI instruction
			rs1 = 0; // rs1 is not used
			immU = 0; // rs2 is not used
			Opcode = 7'b0110111; // LUI instruction
			Funct3 = 3'b000;     // Funct3 is not used
			Funct7 = 7'b0000000; // Funct7 is not used
			#20; // Allow some time for the computation
			$display("Test case 20: LUI result = %d", rd);
			if (rd === 32'h12345000) // Expected result
				 $display("Test case 20 passed");
			else
				 $display("Test case 20 failed");

			// Test case 21: AUIPC instruction
			rs1 = 0; // rs1 is not used
			immU = 0; // rs2 is not used
			Opcode = 7'b0010111; // AUIPC instruction
			Funct3 = 3'b000;     // Funct3 is not used
			Funct7 = 7'b0000000; // Funct7 is not used
			#20; // Allow some time for the computation
			$display("Test case 21: AUIPC result = %d", rd);
			if (rd === 32'h12345000) // Expected result
				 $display("Test case 21 passed");
			else
				 $display("Test case 21 failed");

			// Add more test cases as needed...



        // Finish simulation
        $finish;
    end

endmodule
