module Datamemory #(
    parameter DM_ADDRESS = 9 ,
    parameter DATA_W = 32
    )(
    input logic clk,
	 input logic MemRead , // comes from control unit
    input logic MemWrite , // Comes from control unit
    input logic [ DM_ADDRESS -1:0] a , // Read / Write address - 9 LSB bits of the ALU output
    input logic [ DATA_W -1:0] wd , // Write Data
    output logic [ DATA_W -1:0] rd // Read Data
    );
    
    logic [DATA_W-1:0] mem [(2**DM_ADDRESS)-1:0];
//	 
//	 initial begin
//		mem[5] =32'b00000000011100000000000010010011;
//	 end
//	 
	 
    
   always_comb begin
		if(MemRead)
        rd <= mem[a];
		  
		 else
        rd <= '0; 
	end
 
   
    
    always @(posedge clk) begin
       if (MemWrite)
            mem[a] = wd;
    end
    
endmodule