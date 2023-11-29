module DeMux (
    input logic [31:0] a,
    input logic select,
    output logic [31:0] out1,
    output logic [31:0] out2
);

  assign out1 = (select) ? a : 32'b0;
  assign out2 = (select) ? 32'b0 : a;

endmodule
