module BranchSel(
input logic zero,branch,
input logic rdlast_bit,
input logic [1:0]branch_type,
output logic pcMux
);


always_comb begin
    unique case(branch_type)
        2'b00: pcMux<=(branch & zero);//beq
        2'b01: pcMux<=(branch & (!zero));//bnq
        2'b10: pcMux<=(branch & (rdlast_bit));//blt,bltu
        2'b11: pcMux<=(branch & !(rdlast_bit));//bge,bglu      
    endcase
end


endmodule