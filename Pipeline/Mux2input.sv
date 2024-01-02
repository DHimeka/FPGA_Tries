module Mux2input (
    input logic [31:0] a,
    input logic [31:0] b,
    input logic select,
    output logic [31:0] out
);

  assign out = (select) ? b : a;

endmodule
