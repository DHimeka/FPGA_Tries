module Datamemory #(
    parameter DM_ADDRESS = 9,
    parameter DATA_W = 32
)(
    input logic clk,
    input logic Memcopy,
    input logic MemRead,  // comes from the control unit
    input logic MemWrite, // Comes from the control unit
    input logic [DM_ADDRESS - 1:0] a,  // Read / Write address - 9 LSB bits of the ALU output
    input logic [DATA_W - 1:0] wd,   // Write Data
    input logic [31:0] immout,      // Number of elements to copy
    input logic [31:0] rs1, // Memory address to start copying from
    input logic [31:0] rs2, // Memory address to start copying to
    output logic [DATA_W - 1:0] rd,extmemdata,
	 
	 input logic [8:0] extmemaddress
);

    logic [DATA_W - 1:0] mem[(2**DM_ADDRESS) - 1:0];
	 
	 logic state=0;
	 logic [1:0]signal=2'b00;
	 int i;
	 logic [31:0]start,dest,size;

    always_comb begin
        if (MemRead)
            rd <= mem[a];
        else
            rd <= '0;
    end

    always_ff @(posedge clk) begin
        if (MemWrite)
            mem[a] = wd;
        if (Memcopy) begin
            state=1;
				start=rs1;
				i=0;
				dest=rs2;
				size=immout;
        end
		  if(state==1)begin
			case(signal)
			2'b00: begin
				mem[dest+i]=mem[start+i];
				i=i+1;
				if(i<size)begin
					signal=2'b00;
				end
				else begin
					signal=2'b01;
				end
			end
			2'b01:begin
				state<=0;
			end
			endcase
		  end
		  end
		  
		  
		 assign extmemdata = mem[extmemaddress];
endmodule
