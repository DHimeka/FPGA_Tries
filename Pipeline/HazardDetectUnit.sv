module HazardDetectUnit(
    input logic ID_EX_MemRead_i,
    input logic [4:0] IF_IDrs2_i,ID_EXrd_i,IF_IDrs1_i,
    
    output logic Hazard_o
);



assign Hazard_o = ((ID_EX_MemRead_i && (ID_EXrd_i == IF_IDrs1_i || ID_EXrd_i == IF_IDrs2_i))? 1'b1 : 1'b0);

endmodule
