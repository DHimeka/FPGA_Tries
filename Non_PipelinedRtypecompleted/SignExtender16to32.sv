module SignExtender16to32 (
    input wire [15:0] in,
    output wire [31:0] out
);

    assign out = {in,16'b0};

endmodule
