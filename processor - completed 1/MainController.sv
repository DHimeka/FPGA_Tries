
module MainController(
    
    //Input
   input logic [6:0] Opcode //7-bit opcode field from the instruction
    
    //Outputs
	//output logic regWrite,immSelMux,LoadMux,MemRead,MemWrite,Con_Jalr,BranchSig


);

//    localparam R_TYPE = 7'b0110011;
//    localparam LW     = 7'b0000011;
//    localparam SW     = 7'b0100011;
//    localparam BR     = 7'b1100011;
//    localparam RTypeI = 7'b0010011; //addi,ori,andi
    
//    logic [6:0] R_TYPE, LW, SW, RTypeI, BR, JALR, JAL,AUIPC,LUI;
//    assign  BR     = 7'b1100011;
//    assign  R_TYPE = 7'b0110011;
//    assign  LW     = 7'b0000011;
//    assign  SW     = 7'b0100011;
//    assign  RTypeI = 7'b0010011; //addi,ori,andi
//    assign  JALR = 7'b1100111;
//   
//
//  assign Con_Jalr = (Opcode == JALR);  
//  assign pcBranch = (Opcode == BR);  
//  assign isALUreg  = (Opcode==LW || Opcode==SW || Opcode == RTypeI);
//  assign regWrite = (Opcode==R_TYPE || Opcode==LW || Opcode == RTypeI || Opcode == JALR || Opcode == JAL);
//  assign MemRead  = (Opcode==LW);
//  assign MemWrite = (Opcode==SW||Opcode == JALR);
//  assign immSelMux = (Opcode==RTypeI || Opcode==LW || Opcode==SW || Opcode==BR ||Opcode==JALR);
//  assign LoadMux = (Opcode==LW || Opcode==SW || Opcode ==BR || Opcode==RTypeI);
  //assign ALUOp[0] = (Opcode==BR);
  //assign OpI = (Opcode==RTypeI);
  //assign ALUOp[1] = (Opcode==R_TYPE);

  

endmodule