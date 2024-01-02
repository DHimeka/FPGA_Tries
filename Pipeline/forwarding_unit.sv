module forwarding_unit(
    input logic [4:0]ID_EX_RS1,ID_EX_RS2,EX_MEM_rd,MEM_WB_rd,
    input logic EX_MEM_regWrite,MEM_WB_regWrite,
    output logic [1:0]forward_A_select,forward_B_select
    );
    
always_comb begin
if((ID_EX_RS1==EX_MEM_rd) & (EX_MEM_rd!=0) & (EX_MEM_regWrite==1))begin
    forward_A_select=2'b10;
end 
else if((ID_EX_RS1==MEM_WB_rd) & (MEM_WB_rd!=0) & (MEM_WB_regWrite==1)) begin
    forward_A_select=2'b01;
end 
else begin
    forward_A_select=2'b00;
end

if((ID_EX_RS2==EX_MEM_rd) & (EX_MEM_rd!=0) & (EX_MEM_regWrite==1))begin
    forward_B_select=2'b10;
end 
else if((ID_EX_RS2==MEM_WB_rd) & (MEM_WB_rd!=0) & (MEM_WB_regWrite==1)) begin
    forward_B_select=2'b01;
end 
else begin
    forward_B_select=2'b00;
end

end 
  
endmodule