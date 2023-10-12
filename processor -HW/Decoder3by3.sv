module Decoder3by3 (
    input [31:0] result, // 32-bit input for selecting one of 3 outputs
    input [31:0] Inst, // Instruction input
    output [31:0] out // Output

);
    logic [2:0] selection_input; // 3-bit selection input
    logic [31:0] out_internal; // Internal signal to hold the output value

    LoadStoredecode ld(
        .Opcode(Inst[6:0]),
        .Funct3(Inst[14:12]),
        .Funct7(Inst[31:25]),
        .Control_signal(selection_input)
    );

    always_comb begin
        case (selection_input)
            3'b001: out_internal = {result[7]? {24{1'b1}} :24'b0, result[7:0]}; //lb or sb
            3'b010: out_internal = {result[15]? {16{1'b1}} :16'b0, result[15:0]}; // lh or sh
            3'b011: out_internal = result; // lw or sw
				3'b100: out_internal = {24'b0,result[7:0]};//lbu
				3'b101: out_internal = {16'b0,result[15:0]};//lhu
            default: out_internal = 32'b0; // Default value
        endcase
    end

    assign out = out_internal; // Assign the internal signal to the output
endmodule
