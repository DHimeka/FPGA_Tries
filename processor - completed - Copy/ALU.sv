module ALU #(
    parameter DATA_WIDTH = 32,
    parameter OPCODE_LENGTH = 5
)(
    input logic [DATA_WIDTH-1:0] rs1,
    input logic [DATA_WIDTH-1:0] rs2,
    input logic [OPCODE_LENGTH-1:0] Opcode,
    output logic [DATA_WIDTH-1:0] rd,
    output logic Con_BLT,
    output logic Con_BGT,
    output logic zero
);

    always_comb begin
        rd = 'd0;
        Con_BLT = 'b0;
        Con_BGT = 'b0;
        zero = 'b0;

        case(Opcode)
            // ADD
            5'b00001: rd = rs1 + rs2;

            // SUB
            5'b00010: begin
                rd = rs1 - rs2;
                Con_BLT = ($signed(rd) < $signed(1'd0));
                Con_BGT = ($signed(rd) > $signed(1'd0));
                zero = (rd == 1'd0);
            end

            // SLL
            5'b00011: rd = rs1 << (rs2[4:0] & 5'b11111);

            // SRL
            5'b00100: rd = rs1 >> (rs2[4:0] & 5'b11111);

            // SRA
            4'b00101: rd = $signed(rs1) >>> (rs2[4:0] & 5'b11111);

            // AND
            5'b00110: rd = rs1 & rs2;

            // OR
            5'b00111: rd = rs1 | rs2;

            // XOR
            4'b01000: rd = rs1 ^ rs2;

            // SLT (Set Less Than, signed)
            5'b01001: rd = ($signed(rs1) < $signed(rs2)) ? 1'd1 : 1'd0;

            // SLTU (Set Less Than, unsigned)
            5'b01010: rd = (rs1 < rs2) ? 1'd1 : 1'd0;
////////check from here
            // ADDI
            5'b01011: rd = rs1 + {{(DATA_WIDTH-12){rs2[11]}}, rs2};

            // SLLI
            5'b01100: rd = rs1 << (rs2[4:0] & 5'b11111);

            // SRLI
            5'b01101: rd = rs1 >> (rs2[4:0] & 5'b11111);

            // SRAI
            5'b01110: rd = $signed(rs1) >>> (rs2[4:0] & 5'b11111);

            // ANDI
            5'b01111: rd = rs1 & {{(DATA_WIDTH-12){rs2[11]}}, rs2};

            // ORI
            5'b10000: rd = rs1 | {{(DATA_WIDTH-12){rs2[11]}}, rs2};

            // XORI
            5'b0110: rd = rs1 ^ {{(DATA_WIDTH-12){rs2[11]}}, rs2};

            // SLTI (Set Less Than Immediate, signed)
            5'b10001: rd = ($signed(rs1) < $signed({{(DATA_WIDTH-12){rs2[11]}}, rs2})) ? 1'd1 : 1'd0;

            // SLTIU (Set Less Than Immediate, unsigned)
            5'b10010: rd = (rs1 < {{(DATA_WIDTH-12){rs2[11]}}, rs2}) ? 1'd1 : 1'd0;

            // LUI (Load Upper Immediate)
            5'b10011: rd = {{DATA_WIDTH-12{1'b0}}, rs2};

            // AUIPC (Add Upper Immediate to PC)
            5'b10100: rd = rs1 + {{DATA_WIDTH-12{1'b0}}, rs2};

            default: rd = 'b0;
        endcase
    end
endmodule
