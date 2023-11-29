module RegFiles #(
      // Parameters
      parameter DATA_WIDTH   = 32,  // number of bits in each register
      parameter ADDRESS_WIDTH = 5, //number of registers = 2^ADDRESS_WIDTH
      parameter NUM_REGS = 32
   )
   (
   input  clk, //clock
   input  rst,//synchronous reset; if it is asserted (rst=1), all registers are reseted to 0
   input  RegWrite, //write signal
   input  [ADDRESS_WIDTH-1:0] rg_wrt_dest, //address of the register that supposed to written into
   input  [ADDRESS_WIDTH-1:0] rs1, //first address to be read from
   input  [ADDRESS_WIDTH-1:0] rs2, //second address to be read from
   input  [DATA_WIDTH-1:0] rg_wrt_data, // data that supposed to be written into the register file

   output logic [DATA_WIDTH-1:0] read_reg1, //content of reg_file[rg_rd_addr1] is loaded into
   output logic [DATA_WIDTH-1:0] read_reg2, //content of reg_file[rg_rd_addr2] is loaded into
	output logic [ADDRESS_WIDTH-1:0] extaddress
   );

integer 	 i;

logic [DATA_WIDTH-1:0] register_file [NUM_REGS-1:0];


always @(posedge clk) begin
   if(!rst) begin //if reset iterates thru all registers and sets them to 0
      for (i = 1; i < NUM_REGS; i = i + 1) begin
          register_file[i] <= 0;
		end
	end
   else if(RegWrite && (rg_wrt_dest!=32'b0)) begin//if reset is not 1 and regWrite signal enabled, write data value written to destination register
      register_file[rg_wrt_dest] <=rg_wrt_data;
   end
end

assign read_reg1 = register_file[rs1];
assign read_reg2 = register_file[rs2];
assign extaddress = rg_wrt_dest;

endmodule