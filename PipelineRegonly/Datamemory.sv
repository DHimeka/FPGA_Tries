module Datamemory #(
    parameter DM_ADDRESS = 9 ,
    parameter DATA_W = 32
    )(
    input logic clk,
	 input logic MemRead , // comes from control unit
    input logic MemWrite , // Comes from control unit
    input logic [ DM_ADDRESS -1:0] a , // Read / Write address - 9 LSB bits of the ALU output
    input logic [ DATA_W -1:0] wd , // Write Data
    output logic [ DATA_W -1:0] rd //extmemdata, // Read Data
	 
	 //input logic [8:0] extmemaddress
    );
    
    logic [DATA_W-1:0] mem [(2**DM_ADDRESS)-1:0];
 
    
   always_comb begin
		if(MemRead)
        rd <= mem[a];
		  
		 else
        rd <= '0; 
	end
 
   
    
    always @(posedge clk) begin
       if (MemWrite)begin
            mem[a] = wd;
			
		 end
    end
	 
	 
	//assign extmemdata = mem[extmemaddress];
    
endmodule